from django.conf.urls import url
from . import views

app_name = 'blogs'

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^single/(\d+)/$',views.single,name='single'),
    url(r'^archives/(\d+)/(\d+)/$',views.archives,name='archives'),
    url(r'^category/(\d+)/$',views.category,name='category'),
    url(r'^tags/(\d+)/$',views.tags,name='tags'),
    url(r'^addcomment/(\d+)/$',views.addcomment,name='addcomment'),
]