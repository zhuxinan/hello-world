from django.db import models

# Create your models here.

class BlogUser(models.Model):
    user = models.CharField('昵称',max_length=20)
    class Meta():
        verbose_name = '用户'
        verbose_name_plural = '用户'
    def __str__(self):
        return self.user

class BlogCategory(models.Model):
    name = models.CharField('分类名称',max_length=20)
    class Meta():
        db_table = 'blogcategory'
        verbose_name = '博客分类'
        verbose_name_plural = '博客分类'
    def __str__(self):
        return self.name

class Tags(models.Model):
    name = models.CharField('标签名称',max_length=20)
    class Meta():
        db_table = 'tags'
        verbose_name = '标签'
        verbose_name_plural = '标签'
    def __str__(self):
        return self.name

class Post(models.Model):
    author = models.ForeignKey(BlogUser,verbose_name='作者',on_delete=models.CASCADE)
    category = models.ForeignKey(BlogCategory,verbose_name='博客分类',on_delete=models.CASCADE,default=None)
    tags = models.ManyToManyField(Tags,verbose_name='标签')
    title = models.CharField('标题',max_length=50)
    content = models.TextField('内容')
    pub_date = models.DateTimeField('发布日期',auto_now_add=True)
    views = models.IntegerField('点击数',default=0)
    def __str__(self):
        return self.title
    class Meta():
        db_table = 'post'
        verbose_name = '博客'
        verbose_name_plural = '博客'

class Comment(models.Model):
    post = models.ForeignKey(Post,verbose_name='博客',on_delete=models.CASCADE)
    user = models.ForeignKey(BlogUser,verbose_name='作者',on_delete=models.CASCADE)
    pub_date = models.DateTimeField('发布时间',auto_now_add=True)
    content = models.TextField('内容')
    def __str__(self):
        return self.content
    class Meta():
        db_table = 'comment'
        verbose_name = '评论'
        verbose_name_plural = '评论'
        ordering = ['-pub_date',]



