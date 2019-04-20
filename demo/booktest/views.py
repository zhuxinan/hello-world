from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse,HttpResponseRedirect
from .models import BookInfo,HeroInfo
from django.template import loader,RequestContext

def index(request):
    # return HttpResponse('首页')
    template = loader.get_template('booktest/index.html')
    cont = {"username":"admin"}
    result = template.render(cont)
    return HttpResponse(result)


def list(request):
    # return HttpResponse('列表页')
    book = BookInfo.objects.all()
    return render(request,'booktest/list.html',{"booklist":book})

def detail(request,id):
    # try:
    #     book = BookInfo.objects.get(pk=int(id))
    #     return HttpResponse('detail %s' %book)
    # except:
    #     return HttpResponse('id不对，请重新输入')
    book = BookInfo.objects.get(pk=id)
    return render(request,'booktest/detail.html',{"book":book})

def delete(request,id):
    # return HttpResponse("删除成功")
    BookInfo.objects.get(pk=id).delete()
    book = BookInfo.objects.all()
    # return render(request, 'booktest/list.html', {"booklist": book})
    return HttpResponseRedirect('/booktest/list/',{"booklist": book})

def addhero(request,bookid):
    # return HttpResponse("添加成功")
    return render(request,'booktest/addhero.html',{'bookid':bookid})


def addhandler(request,bookid):
    # return HttpResponse("添加成功")
    hname = request.POST['hname']
    hgender = request.POST['gender']
    hcontent = request.POST['hcontent']
    book = BookInfo.objects.get(pk=bookid)
    HeroInfo.objects.create(hname=hname,hgender=hgender,hcontent=hcontent,hbook=book)
    return HttpResponseRedirect('/booktest/detail/'+str(bookid)+'/')

def addbook(request):
    return render(request, 'booktest/addbook.html')

def addbookhandler(request):
    bname = request.POST['bname']
    BookInfo.objects.create(bname=bname)
    return HttpResponseRedirect('/booktest/list/')

def edit(request,bookid):
    # print(book)
    return render(request,'booktest/edit.html',{'bookid':bookid})

def update(request,id):
    # return HttpResponse("修改成功")
    newname = request.POST['bname']
    result = BookInfo.objects.get(pk=id)
    result.bname = newname
    result.save()
    return HttpResponseRedirect('/booktest/list/')

def heroedit(request,heroid):
    # return HttpResponse("编辑成功")
    hero = HeroInfo.objects.get(pk=heroid)
    return render(request,'booktest/heroedit.html',{'hero':hero})

def heroupdate(request,heroid):
    newname = request.POST['hname']
    newgender = request.POST['gender']
    newcontent = request.POST['hcontent']
    result = HeroInfo.objects.get(pk=heroid)
    result.hname = newname
    result.hgender = newgender
    result.hcontent = newcontent
    result.save()
    return HttpResponseRedirect('/booktest/detail/'+str(result.hbook.id)+'/')

def herodelete(request,heroid):
    hero = HeroInfo.objects.get(pk=heroid)
    hero.delete()
    return HttpResponseRedirect('/booktest/detail/'+str(hero.hbook.id)+'/')