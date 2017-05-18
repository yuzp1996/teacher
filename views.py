# -*- coding: utf-8 -*-
from django.http import  HttpResponse,Http404
import datetime

from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
import hashlib
@csrf_exempt
def index(request):
    token = 'yuzhipeng'    # 填入你的 Token
    signature = request.GET.get('signature', '')
    timestamp = request.GET.get('timestamp', '')
    nonce = request.GET.get('nonce', '')
    # 计算排序后的哈希值并比较
    tmp_sig = hashlib.sha1(''.join(sorted([token, timestamp, nonce]))).hexdigest()
    if tmp_sig == signature:
        return HttpResponse(request.GET.get('echostr', ''))
    return HttpResponse('error')







def hello(request):
	return HttpResponse("Hello World")


def current_datetime(request):
	now = datetime.datetime.now()
	html = "<html><body>It is now %s.</body></html>" % now
	return HttpResponse(html)



def hours_ahead(request, offset):
	try:
		offset = int(offset)
	except ValueError:
		raise Http404()
	# assert False   可用作调试信息使用，在出错页看到更多信息
	dt = datetime.datetime.now() + datetime.timedelta(hours=offset)
	html = "<html><body>In %s hour(s), it will be %s.</body></html>" % (offset, dt)
	return HttpResponse(html)
