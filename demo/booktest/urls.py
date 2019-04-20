from django.conf.urls import url
from . import views

app_name = "booktest"

urlpatterns = [
    url(r'^index/$',views.index,name='index'),
    url(r'^list/$',views.list,name='list'),
    url(r'^detail/(\d+)/$',views.detail,name='detail'),
    url(r'^delete/(\d+)/$',views.delete,name='delete'),
    url(r'^addhero/(\d+)/$',views.addhero,name='addhero'),
    url(r'^addhandler/(\d+)/$',views.addhandler,name='addhandler'),
    url(r'^addbook/$',views.addbook,name='addbook'),
    url(r'^addbookhandler/$',views.addbookhandler,name='addbookhandler'),
    url(r'^edit/(\d+)/$',views.edit,name='edit'),
    url(r'^update/(\d+)/$',views.update,name='update'),
    url(r'^heroedit/(\d+)/$',views.heroedit,name='heroedit'),
    url(r'^heroupdate/(\d+)/$',views.heroupdate,name='heroupdate'),
    url(r'^herodelete/(\d+)/$',views.herodelete,name='herodelete'),
]