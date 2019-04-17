from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from .models import BookInfo,HeroInfo

def index(request):
    return HttpResponse('首页')

def list(request):
    return HttpResponse('列表页')

def detail(request,id):
    try:
        book = BookInfo.objects.get(pk=int(id))
        return HttpResponse('detail %s' %book)
    except:
        return HttpResponse('id不对，请重新输入')
