from django.shortcuts import render
from .models import MyUser,Book,BorrowHistory
# Create your views here.
from django.shortcuts import render,redirect,reverse,get_object_or_404
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib.auth.models import User
import datetime
from datetime import timedelta

def index(request):
    return render(request,'books/index.html')

def reader_login(request):
    if request.method == 'POST' and request.POST:
        name = request.POST.get('username')
        password = request.POST.get('password')
        user = MyUser.objects.filter(username=name).first()
        if user:
            mypassword = user.password
            if password == mypassword:
                request.session['username'] = name
                res = render(request,'books/reader.html',{'user':user})
                return res
            else:
                error = '密码错误'
                return render(request,'books/reader_login.html',{'error':error})
        else:
            error = '用户不存在'
            return render(request,'books/reader_login.html',{'error':error})

    return render(request,'books/reader_login.html')

def logout(request):
    del request.session['username']
    return redirect(reverse('books:index'))

def reader_query(request):
    return render(request,'search/search.html')

def reader_info(request,id):
    user = MyUser.objects.get(pk=id)
    return render(request,'books/reader_info.html',{'user':user})

def reader_histroy(request,id):
    user = MyUser.objects.get(pk=id)
    histroy = BorrowHistory.objects.filter(user=user)
    return render(request,'books/reader_histroy.html',{'histroy':histroy})

def reader(request):
    id = MyUser.objects.get(username=request.session.get('username')).id
    user = MyUser.objects.get(pk=id)
    return render(request,'books/reader.html',{'user':user})

def reader_book(request,id):
    if request.method == 'GET':
        book  = Book.objects.get(pk=id)
        history = BorrowHistory.objects.filter(book=book).first()
        return render(request,'books/reader_book.html',{'book':book,'history':history})
    elif request.method == 'POST':
        user = MyUser.objects.get(username=request.session.get('username'))
        book = Book.objects.get(pk=id)
        history = BorrowHistory.objects.filter(book=book).first()
        if history:
            return render(request, 'books/reader_book.html', {'book': book, 'history': history,'error':'已被借阅，'
                                                                                                       '请耐心等待'})
        else:
            history = BorrowHistory()
            history.user = user
            history.book = book
            history.darereturn = datetime.datetime.now() + timedelta(days=30)
            history.save()
            history = BorrowHistory.objects.filter(book=book).first()
            return render(request, 'books/reader_book.html', {'book': book, 'history': history})

def reader_modify(request,id):
    if request.method == 'GET':
        user = MyUser.objects.get(pk=id)
        return render(request, 'books/reader_modify.html',{'user':user} )
    elif request.method == 'POST':
        name = request.POST['username']
        pwd = request.POST['password']
        college = request.POST['college']
        num = request.POST['number']
        user = MyUser.objects.get(pk=id)
        user.username = name
        user.password = pwd
        user.college = college
        user.num = num
        user.save()
        return redirect(reverse('books:reader_info',args=id))


def register(request):
    if request.method == 'POST' and request.POST:
        PostDate = request.POST
        name = PostDate.get('username')
        checkuser = User.objects.filter(username=name).first()
        password = PostDate.get('password')
        password2 = PostDate.get('password2')
        college = PostDate.get('college')
        num = PostDate.get('number')
        if checkuser:
            return render(request, 'books/register.html', {'error': '用户名已存在'})
        else:
            if password == password2:
                user = MyUser()
                user.username = name
                user.password = password
                user.college = college
                user.number = num
                user.save()
                return render(request,'books/reader_login.html')
            else:
                return render(request, 'books/register.html',{'error':'两次密码输入不一致'})
    return render(request,'books/register.html')

