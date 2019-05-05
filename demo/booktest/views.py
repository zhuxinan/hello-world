from django.shortcuts import render,redirect,reverse

# Create your views here.
from django.http import HttpResponse,HttpResponseRedirect
from .models import BookInfo,HeroInfo
from django.template import loader,RequestContext
from .forms import AddFrom

def index(request):
    # return HttpResponse('首页')
    # template = loader.get_template('booktest/index.html')
    # cont = {"username":"admin"}
    # result = template.render(cont)
    # return HttpResponse(result)
    # name = request.session.get('username')
    return render(request,'booktest/index.html',{'username':request.session.get('username')})

def login(request):
    # if request.method == "GET":
    #     return render(request,'booktest/login.html')
    # elif request.method == "POST":
    #     request.session['username'] = request.POST['username']
    #     request.session.set_expiry(60)
    #     return redirect(reverse('booktest:index'))
    if request.method == "GET":
        form = AddFrom()
        return render(request,'booktest/login.html',{'form':form})
    elif request.method == "POST":
        form = AddFrom(request.POST)
        if form.is_valid():
            a = form.cleaned_data['a']
            b = form.cleaned_data['b']
            return HttpResponse(str(int(a))+str(int(b)))

def logout(request):
    return redirect(reverse('booktest:index'))

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

def csrf1(request):
    return render(request,'booktest/csrf1.html')
def csrf2(request):
    uname = request.POST['uname']
    return render(request,'booktest/csrf2.html',{'uname':uname})