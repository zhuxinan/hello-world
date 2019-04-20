from django.db import models

# Create your models here.

class BookInfo(models.Model):
    bname = models.CharField(max_length=20)
    bpub_date = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.bname

    def name(self):
        return self.bname
    name.short_description = '书籍名称'

    def pub_date(self):
        return self.bpub_date
    pub_date.short_description = '发行时间'

class HeroInfo(models.Model):
    hname = models.CharField(max_length=20)
    hgender = models.BooleanField()
    hcontent = models.CharField(max_length=100)
    hbook = models.ForeignKey('BookInfo',on_delete=models.CASCADE)
    def __str__(self):
        return self.hname

    def skill(self):
        return self.hname
    skill.short_description = '人物名称'

    def gender(self):
        return self.hgender
    gender.short_description = '人物性别'

    def content(self):
        return self.hcontent
    content.short_description = '人物简介'


