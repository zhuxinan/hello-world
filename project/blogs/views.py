from django.shortcuts import render,redirect,reverse,get_object_or_404
from django.http import HttpResponse,HttpResponseRedirect
from .models import BlogUser,BlogCategory,Tags,Post,Comment
from django.template import loader,RequestContext
import markdown
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
from markdown.extensions.toc import *
from django.utils.text import *
# Create your views here.

def index(request):
    post = Post.objects.all().order_by('-pub_date')
    dates = post.dates('pub_date','month')
    categorys = BlogCategory.objects.all()
    tags = Tags.objects.all()
    pagintor = Paginator(post,2)
    page = request.GET.get('page')
    try:
        blogs = pagintor.page(page)
    except PageNotAnInteger:
        blogs = pagintor.page(1)
    except EmptyPage:
        blogs = pagintor.page(pagintor.num_pages)
    posts = Post.objects.all().order_by('-pub_date')[:3]
    return render(request,'blogs/index.html',{'post':blogs,'dates':dates,'categorys':categorys,
                                              'tags':tags,'posts':posts})

def single(request,id):
    post = Post.objects.get(pk=id)
    comment = post.comment_set.all()
    post.views += 1
    post.save()
    md = markdown.Markdown(extensions=[
        'markdown.extensions.extra',
        'markdown.extensions.codehilite',
        # 'markdown.extensions.toc',
        TocExtension(slugify=slugify),
    ])
    post.content = md.convert(post.content)
    post.toc = md.toc
    dates = Post.objects.dates('pub_date', 'month')
    tags = Tags.objects.all()
    categorys = BlogCategory.objects.all()
    posts = Post.objects.all().order_by('-pub_date')[:3]
    return render(request,'blogs/single.html',{'post':post,'comment':comment,'tags':tags,'categorys':categorys,
                                               'dates':dates,'posts':posts})

def archives(request,year,month):
    post = Post.objects.filter(pub_date__year = year,
                                    pub_date__month = month)
    dates = Post.objects.dates('pub_date', 'month')
    categorys = BlogCategory.objects.all()
    tags = Tags.objects.all()
    posts = Post.objects.all().order_by('-pub_date')[:3]
    return render(request,'blogs/index.html',{'post':post,'dates':dates, 'categorys': categorys,'tags':tags,
                                              'posts':posts})

def category(request,id):
    cate = get_object_or_404(BlogCategory,pk=id)
    post = Post.objects.filter(category=cate)
    categorys = BlogCategory.objects.all()
    dates = post.dates('pub_date', 'month')
    tags = Tags.objects.all()
    posts = Post.objects.all().order_by('-pub_date')[:3]
    return render(request, 'blogs/index.html', {'post': post, 'dates': dates, 'categorys': categorys,
                                                'tags':tags,'posts': posts})

def tags(request,id):
    post = Tags.objects.get(pk=id).post_set.all()
    categorys = BlogCategory.objects.all()
    dates = Post.objects.dates('pub_date', 'month')
    tags = Tags.objects.all()
    posts = Post.objects.all().order_by('-pub_date')[:3]
    return render(request, 'blogs/index.html', {'post': post, 'dates': dates, 'categorys': categorys,
                                                'tags':tags,'posts': posts})

def addcomment(request,id):
    user = request.POST['name']
    result = BlogUser.objects.filter(user=user)[0]
    content = request.POST['comment']
    post = Post.objects.get(pk=id)
    Comment.objects.create(user=result,content=content,post=post)
    return HttpResponseRedirect('/blogs/single/'+str(id)+'/')




