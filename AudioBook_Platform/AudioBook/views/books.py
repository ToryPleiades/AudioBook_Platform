from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from django.http import JsonResponse
from common.models import Books, Types
from django.db.models import Q
from datetime import datetime
import time
import os


def index(request):
    """商品信息主页面"""
    tlist = Types.objects.extra(select={
        'path_id': 'concat(path,id)'
    }).order_by('path_id')
    for ob in tlist:
        ob.pname = '. . .' * (ob.path.count(',') - 1)
    mod = Books.objects.order_by('id')
    mywhere = []

    # 获取、判断并封装关keyword键搜索
    kw = request.GET.get('keyword', None)
    if kw:
        # 查询商品名中只要含有关键字的都可以
        good_list = mod.filter(goods__contains=kw)
        mywhere.append('keyword=' + kw)
    else:
        good_list = mod.filter()
    # 获取、判断并封装商品类别typeid搜索条件
    typeid = request.GET.get('typeid', '0')
    if typeid != '0':
        tids = Types.objects.filter(Q(id=typeid) | Q(pid=typeid)).values_list(
            'id', flat=True)
        good_list = good_list.filter(typeid__in=tids)
        mywhere.append('typeid=' + typeid)

    # 获取商品类别名称
    for vo in good_list:
        ty = Types.objects.get(id=vo.typeid)
        vo.typename = ty.name

    # 实现分页功能
    paginator = Paginator(good_list, 10)  # 实例化Paginator, 每页显示10条数据
    page = request.GET.get('page', 1)
    pag = paginator.page(page)

    context = {'goodslist': pag, 'mywhere': mywhere, 'typelist': tlist}
    return render(request, 'backstage/goods/index.html', context)


def add(request):
    """添加商品信息"""
    # 获取商品类别信息
    type_list = Types.objects.extra(select={
        'path_id': 'concat(path, id)'
    }).order_by('path_id')

    for ob in type_list:
        ob.pname = '. . . ' * (ob.path.count(',') - 1)

    context = {'typelist': type_list}
    return render(request, 'backstage/goods/add.html', context)


def insert(request):
    """执行添加"""
    try:
        ob = Books()

        # 音频, 图片上传
        audio = request.FILES.get('productAudio', None)
        if not audio:
            ob.audio = None
        else:
            audio_name = str(time.time()) + '.' + audio.name.split('.').pop()
            with open('./static/commodity/' + audio_name, 'wb+') as destination:
                for chunk in audio.chunks():
                    destination.write(chunk)
            ob.audio = audio_name

        pic = request.FILES.get('productPic', None)
        if not pic:
            context = {
                'Info': 'Addition Failed',
                'Detail': 'No pictures detected'
            }
            return render(request, 'backstage/info.html', context)
        pic_name = str(time.time()) + '.' + pic.name.split('.').pop()
        with open('./static/commodity/' + pic_name, 'wb+') as destination:
            for chunk in pic.chunks():
                destination.write(chunk)

        ob.typeid = request.POST['typeID']
        ob.author = request.POST['Author']
        ob.goods = request.POST['BookName']
        ob.content = request.POST['bookIntroduction']
        ob.addtime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.pic = pic_name
        ob.novel = request.POST['Novel']
        ob.save()
        return redirect('/goods')
    except Exception as err:
        print(err)
        context = {'Info': 'Addition Failed', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def preview(request, gid):
    """商品信息浏览"""
    try:
        ob = Books.objects.get(id=gid)
        context = {'goods': ob}
        return render(request, 'backstage/goods/preview.html', context)
    except Exception as err:
        print(err)
        context = {'Info': 'Cannnot fetch the page', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def edit(request, gid):
    """商品信息编辑"""
    try:
        ob = Books.objects.get(id=gid)
        context = {'goods': ob}
        return render(request, 'backstage/goods/edit.html', context)
    except Exception as err:
        print(err)
        context = {'Info': 'Cannnot fetch the page', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def update(request, gid):
    """执行编辑"""
    ob = Books.objects.get(id=gid)

    if request.POST.get('AudioSignal') != '1':
        edit_audio = request.FILES.get('updateAudio')
        if not edit_audio:
            context = {
                'Info': 'Addition Failed',
                'Detail': 'No audios detected'
            }
            return render(request, 'backstage/info.html', context)
        update_audio = str(time.time()) + '.' + edit_audio.name.split('.').pop()
        with open('./static/commodity/' + update_audio, 'wb+') as destination:
            for chunk in edit_audio.chunks():
                destination.write(chunk)
        ob.audio = update_audio

    if request.POST.get('PicSignal') != '1':
        edit_pic = request.FILES.get('updatePic', None)
        if not edit_pic:
            context = {
                'Info': 'Addition Failed',
                'Detail': 'No pictures detected'
            }
            return render(request, 'backstage/info.html', context)
        update_pic = str(time.time()) + '.' + edit_pic.name.split('.').pop()
        with open('./static/commodity/' + update_pic, 'wb+') as destination:
            for chunk in edit_pic.chunks():
                destination.write(chunk)
        ob.pic = update_pic

    ob.goods = request.POST['BookName']
    ob.author = request.POST['Author']
    ob.content = request.POST['productIntroduction']
    ob.novel = request.POST['Novel']
    ob.save()
    return redirect('/goods')


def delete(request, gid):
    """商品信息删除"""
    try:
        ob = Books.objects.get(id=gid)
        ob.delete()
        return redirect('/goods')
    except Exception as err:
        print(err)
        context = {'Info': 'Delete Failed', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def audio_delete(request, aid):
    """音频信息删除"""
    try:
        ob = Books.objects.get(audio=aid)
        os.remove('./static/commodity/')
        ob.audio = None
        ob.save()
        return redirect('/goods')
    except Exception as err:
        print(err)
        context = {'Info': 'Delete Failed', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def pic_delete(request, pid):
    """图片信息删除"""
    try:
        ob = Books.objects.get(pic=pid)
        os.remove('./static/commodity/')
        ob.pic = None
        ob.save()
        return redirect('/goods')
    except Exception as err:
        print(err)
        context = {'Info': 'Delete Failed', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def json(request):
    """返回数据JSON"""
    try:
        json_data = Books.objects.all()
        book_list = []
        for vo in json_data:
            js_data = vo.toDict()
            if js_data['audio']:
                js_data['audio'] = 'http://121.40.199.164:8000/static/commodity/' + js_data['audio']
            if js_data['pic']:
                js_data['pic'] = 'http://121.40.199.164:8000/static/commodity/' + js_data['pic']
            book_list.append(js_data)

        data = {
            'name': '书籍列表',
            'data': book_list
        }

        return JsonResponse(data, json_dumps_params={'ensure_ascii': False})
    except Exception as err:
        print(err)
        context = {'Info': 'Fetch json FAILED', 'Detail': err}
        return render(request, 'backstage/info.html', context)
