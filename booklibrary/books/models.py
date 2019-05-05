from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class MyUser(User):
    college = models.CharField(max_length=50)
    num = models.CharField(max_length=20)
    class Meta():
        verbose_name = '用户'
        verbose_name_plural = '用户'

class Book(models.Model):
    bname = models.CharField(max_length=20)
    author = models.CharField(max_length=20)
    pub_com = models.CharField(max_length=30)
    pub_date = models.DateTimeField(auto_now_add=True)
    class Meta():
        verbose_name = '书籍'
        verbose_name_plural = '书籍'
    def __str__(self):
        return self.bname

class BorrowHistory(models.Model):
    book = models.ForeignKey(Book,on_delete=models.CASCADE)
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    dateborrow = models.DateTimeField(auto_now_add=True)
    darereturn = models.DateTimeField()
    status = models.CharField(default='否',max_length=10)
    class Meta():
        verbose_name = '借阅历史'
        verbose_name_plural = '借阅历史'

class HeatMap(models.Model):
    name = models.CharField(max_length=20)
    img = models.ImageField(upload_to='heatmap')
    index = models.SmallIntegerField(unique=True)
    def __str__(self):
        return self.name

from tinymce.models import HTMLField
class Messige(models.Model):
    title = models.CharField(max_length=50)
    content = HTMLField()
    def __str__(self):
        return self.title