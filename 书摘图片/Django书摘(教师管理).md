# django的使用（教师管理系统）

>django-admin startproject teacher

>from views import hello

> 快速搭建应用 python manage.py startapp

 url不能随便加上/      
 url(r'^search$/',search),会报错 
 
 url(r'^search$/',search),不会报错
 
 调用函数时比如这个search函数时，要把      
 
 >    'django.middleware.csrf.CsrfViewMiddleware',

注释掉，在MIDDLEWARE_CLASSES中


注意这个问题
> def search(req):
	req = req.POST#这是个需要注意的地方，不懂得不知道的太多了
	if 'stcourse' in req:
		print("ddsds")
		try:

要弄明白这是怎么回事