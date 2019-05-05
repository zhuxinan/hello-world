from django.shortcuts import render
from .models import MyUser,Book,BorrowHistory,HeatMap,Messige
# Create your views here.
from django.shortcuts import render,redirect,reverse,get_object_or_404
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib.auth.models import User
import datetime
from datetime import timedelta
from django.core.mail import send_mail,send_mass_mail
from django.conf import settings
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer,BadSignature,SignatureExpired
from django.views.decorators.cache import cache_page
from PIL import Image,ImageDraw,ImageFont
import random,io

@ cache_page(60*5)
def index(request):
    img = HeatMap.objects.all().order_by('index')
    messige = Messige.objects.all()
    return render(request,'books/index.html',{'img':img,'messige':messige})

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
        mail = PostDate.get('email')
        if checkuser:
            return render(request, 'books/register.html', {'error': '用户名已存在'})
        else:
            if password == password2:
                user = MyUser()
                user.username = name
                user.password = password
                user.college = college
                user.number = num
                user.is_active = False
                user.email = mail
                user.save()
                id = MyUser.objects.get(username=name).id
                result = Serializer(settings.SECRET_KEY,60)
                idstr = result.dumps({'userid':id}).decode('utf-8')
                send_mail('激活账户',"<a href='http://127.0.0.1:8000/books/active/%s'>点击激活</a>"%(idstr,),settings.DEFAULT_FROM_EMAIL,[mail,])
                return render(request,'books/reader_login.html')
            else:
                return render(request, 'books/register.html',{'error':'两次密码输入不一致'})
    return render(request,'books/register.html')

def edit(request):
    if request.method == 'GET':
        return render(request,'books/edit.html')
    else:
        messige = Messige()
        messige.title = request.POST['title']
        messige.content = request.POST['content']
        messige.save()
        return redirect(reverse('books:index'))

def email(request):
    try:
        send_mail("django邮件发送测试1","django可以一次发送一封邮件",settings.DEFAULT_FROM_EMAIL,['17630236231@163.com',])
        return HttpResponse('发送成功')
    except Exception as e:
        print(e)
        return HttpResponse('发送失败')

def active(request,idstr):
    try:
        result = Serializer(settings.SECRET_KEY, 60)
        id = result.loads(idstr)['userid']
        user = MyUser.objects.get(pk=id)
        user.is_active = True
        user.save()
        return redirect(reverse('books:reader_login'))
    except SignatureExpired as e:
        return HttpResponse('激活超时')

def ajax(request):
    return HttpResponse('加载成功')

def load(request):
    if request.method == 'GET':
        return render(request,'books/load.html')

def verifycode(request):
    # 定义变量，用于画面的背景色、宽、高
    bgcolor = (random.randrange(20, 100),
               random.randrange(20, 100),
               random.randrange(20, 100))
    width = 100
    heigth = 25

    # 创建画面对象
    im = Image.new('RGB', (width, heigth), bgcolor)

    # 创建画笔对象
    draw = ImageDraw.Draw(im)

    # 调用画笔的point()函数绘制噪点
    for i in range(0, 100):
        xy = (random.randrange(0, width), random.randrange(0, heigth))
    fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
    draw.point(xy, fill=fill)

    # 定义验证码的备选值
    str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0'

    # 随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]

    # 构造字体对象
    font = ImageFont.truetype('SCRIPTBL.TTF', 23)
    fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))

    # 绘制4个字
    draw.text((5, 2), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, 2), rand_str[1], font=font, fill=fontcolor)
    draw.text((50, 2), rand_str[2], font=font, fill=fontcolor)
    draw.text((75, 2), rand_str[3], font=font, fill=fontcolor)

    # 释放画笔
    del draw
    request.session['verifycode'] = rand_str
    f = io.BytesIO()
    im.save(f, 'png')
    # 将内存中的图片数据返回给客户端，MIME类型为图片png
    return HttpResponse(f.getvalue(), 'image/png')