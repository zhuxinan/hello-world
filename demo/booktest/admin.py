from django.contrib import admin
from .models import BookInfo,HeroInfo

# Register your models here.

class HeroInfoInline(admin.StackedInline):
    model = HeroInfo
    extra = 1

class BookInfoAdmin(admin.ModelAdmin):
    list_display = ['name','pub_date']
    list_filter = ['bname']
    search_fields = ['bname']
    inlines = [HeroInfoInline]

admin.site.register(BookInfo,BookInfoAdmin)

class HeroInfoAdmin(admin.ModelAdmin):
    list_display = ['skill','gender','content']
    list_filter = ['hgender']
    search_fields = ['hname','hgender']
    list_per_page = 2

admin.site.register(HeroInfo,HeroInfoAdmin)