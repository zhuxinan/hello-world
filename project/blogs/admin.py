from django.contrib import admin

# Register your models here.
from .models import BlogUser,BlogCategory,Tags,Post,Comment

admin.site.register(BlogUser)
admin.site.register(BlogCategory)
admin.site.register(Tags)
admin.site.register(Post)
admin.site.register(Comment)

