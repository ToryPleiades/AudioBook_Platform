from django.db import models
from datetime import datetime


# Create your models here.
class Users(models.Model):
    """用户信息模型"""
    username = models.CharField(max_length=32)  # 昵称
    password = models.CharField(max_length=32)  # 密码
    sex = models.IntegerField(default=1)  # 性别（1，0代替男女)
    phone = models.CharField(max_length=16)  # 电话号码
    email = models.CharField(max_length=50)  # 电子邮箱
    state = models.IntegerField(default=1)  # 会员状态（1：启用，2：禁用，0：管理员）
    addtime = models.DateTimeField(default=datetime.now)  # 会员注册时间

    def toDict(self):
        return {
            'id': self.id,
            'username': self.username,
            'password': self.password,
            'phone': self.phone,
            'email': self.email,
            'state': self.state,
        }

    class Meta:
        db_table = 'users'  # 指定数据库表名（默认common_users)
        ordering = ['id']  # 模型按ID排序


class Types(models.Model):
    """电子书类别模型"""
    name = models.CharField(max_length=32)      # 类别名称
    pid = models.IntegerField(default=0)        # 父类别路径
    path = models.CharField(max_length=255)     # 路径

    def toDict(self):
        return {
            'id': self.id,
            'name': self.name,
            'pid': self.pid,
            'path': self.path
        }

    class Meta:
        db_table = 'type'


class Books(models.Model):
    """电子书信息模型"""
    typeid = models.IntegerField()  # 电子书类别ID
    goods = models.CharField(max_length=32)     # 电子书名
    author = models.CharField(max_length=32)    # 电子书作者
    content = models.TextField()                # 电子书描述
    addtime = models.DateTimeField(default=datetime.now)
    audio = models.CharField(max_length=100)    # 音频
    pic = models.CharField(max_length=100)      # 图片
    novel = models.TextField()                  # 电子书内容

    def toDict(self):
        return {
            'id': self.id,
            'typeid': self.typeid,
            'goods': self.goods,
            'author': self.author,
            'content': self.content,
            'audio': self.audio,
            'pic': self.pic,
            'novel': self.novel,
        }

    class Meta:
        db_table = 'books'
