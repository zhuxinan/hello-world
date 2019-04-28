from django.contrib import admin
from .models import BorrowHistory,Book,MyUser
# Register your models here.
admin.site.register(Book)
admin.site.register(BorrowHistory)
admin.site.register(MyUser)