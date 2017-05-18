# -*- coding: utf-8 -*-
from django.contrib import admin

# Register your models here.
from managesys.models import Student,Course,Teacher,Score,Class

class TeacherAdmin(admin.ModelAdmin):#编辑admin显示的项目以及次序
    fields = [ 'StuNumId','CourseId','Term','Score']#显示的次序
    list_filter=['StuNumId']#过滤器 根据什么可以过滤
    list_filter=['CourseId']
    search_fields = ['question_text']
    list_per_page=10#太好用了 后台的 显示多少条数据

admin.site.register([Teacher,Course,Student,Class])#注册所有的对象
admin.site.register(Score,TeacherAdmin)#注册了上面的class方法就可以在后台直接使用了