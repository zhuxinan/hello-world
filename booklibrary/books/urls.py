from django.conf.urls import url
from . import views
from haystack.views import SearchView

app_name = 'books'

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^reader_login/$',views.reader_login,name='reader_login'),
    url(r'^reader/$',views.reader,name='reader'),
    url(r'^reader_book/(\d+)/$',views.reader_book,name='reader_book'),
    url(r'^reader_histroy/(\d+)/$',views.reader_histroy,name='reader_histroy'),
    url(r'^reader_info/(\d+)/$',views.reader_info,name='reader_info'),
    url(r'^reader_modify/(\d+)/$',views.reader_modify,name='reader_modify'),
    url(r'^register/$',views.register,name='register'),
    url(r'^reader_query/$',views.reader_query,name='reader_query'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^search/$',SearchView(),name='search'),

]