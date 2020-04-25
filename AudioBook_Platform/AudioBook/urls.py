from .views import index, users, types, books
from django.urls import path

urlpatterns = [
    path('', index.index, name='backstage_index'),

    # 后台管理员路由
    path('sign_in', index.sign_in, name='backstage_sign_in'),
    path('login', index.login, name='backstage_login'),
    path('sign_out', index.logout, name='backstage_sign_out'),

    # 会员信息管理路由
    path('users', users.index, name='backstage_users_index'),
    path('users/add', users.add, name='backstage_users_add'),
    path('users/insert', users.insert, name='backstage_users_insert'),
    path('users/edit/<int:uid>', users.edit, name='backstage_users_edit'),
    path('users/update/<int:uid>', users.update,
         name='backstage_users_update'),
    path('users/del/<int:uid>', users.delete, name='backstage_users_del'),
    path('users/resetpwd/<int:uid>',
         users.resetpwd,
         name='backstage_users_resetpwd'),
    path('users/reset/<int:uid>', users.do_reset,
         name='backstage_users_reset'),

    # 后台电子书目录路由
    path('types', types.index, name='backstage_types_index'),
    path('types/add/<int:tid>', types.add, name='backstage_types_add'),
    path('types/insert', types.insert, name='backstage_types_insert'),
    path('types/edit/<int:tid>', types.edit, name='backstage_types_edit'),
    path('types/update/<int:tid>', types.update,
         name='backstage_types_update'),
    path('types/del/<int:tid>', types.delete, name='backstage_types_del'),

    # 电子书信息管理路由
    path('goods', books.index, name='backstage_goods_index'),
    path('goods/add', books.add, name='backstage_goods_add'),
    path('goods/insert', books.insert, name='backstage_goods_insert'),
    path('goods/preview/<int:gid>', books.preview, name='backstage_goods_preview'),
    path('goods/edit/<int:gid>', books.edit, name='backstage_goods_edit'),
    path('goods/update/<int:gid>', books.update,
         name='backstage_goods_update'),
    path('goods/del/<int:gid>', books.delete, name='backstage_goods_del'),
    path('goods/audio_del/<aid>', books.audio_delete, name='backstage_audio_del'),
    path('goods/pic_del/<pid>', books.pic_delete, name='backstage_pic_del'),
    path('goods/json', books.json, name='backstage_json')
]
