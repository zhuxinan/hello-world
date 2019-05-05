from django.contrib import admin
from .models import BorrowHistory,Book,MyUser,HeatMap,Messige
# Register your models here.
admin.site.register(Book)
admin.site.register(BorrowHistory)
admin.site.register(MyUser)
admin.site.register(HeatMap)
admin.site.register(Messige)