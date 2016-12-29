# -*- coding: utf-8 -*-
from __future__ import division
from django.shortcuts import render,render_to_response
from managesys.models import Student,Course,Teacher,Score,Class
from django.http import HttpResponse
import json



# Create your views here.
def index(request):
	student = Student.objects.all()
	course = Course.objects.all()
	teacher = Teacher.objects.all()
	score = Score.objects.all()
	data = {
    'student':student,
    'course':course,
    'teacher':teacher,
	'score':score,
	}
	return render(request,'index.html',data)

def search(req):
	req = req.POST#这是个需要注意的地方，不懂得不知道的太多了
	if 'stcourse' in req:
		try:
			stname = req['stname']
			stterm = req['stterm']
			stcourse = req['stcourse']
			studentId = Student.objects.get(StuName = stname)
			stcourse = Course.objects.get(CourseName = stcourse)
			score = Score.objects.get(CourseId_id = stcourse,StuNumId = studentId,Term = stterm).Score
			return HttpResponse(score)
		except Exception as err:
			print(err)
			return HttpResponse("nima")
	elif 'Class' in req:
		try:
			myClass = req['Class']#这里最开始没有加上CLass就直接用了，而且根本没有将名字转换成相应的ID 名字不能重复，比如下面的那行
			Class1 = Class.objects.get(ClassName = myClass).ClassId
			student = Student.objects.filter(ClassId = Class1)
			Trems = req['Trems']
			course = req['Course']
			stcourse = Course.objects.get(CourseName = course)
			score = Score.objects.filter(CourseId = stcourse,Term = Trems)
			dataval = 0
			num = 0
			len = 0
			myval = []#所有的成绩都放在里面
			for obj in score:
				if obj.StuNumId in student:
					if(obj.Score>60):
						num = num+1
					dataval = dataval+obj.Score
					len = len+1
					myval.append(obj.Score)
					passrate = num/len#通过率
			List = []#这里根本你就不会，只会照葫芦画瓢 一定啊屁用不管
			data = {}
			data['max'] = max(myval)
			data['min'] = min(myval)
			data['passrate'] = passrate
			data['dataval'] = dataval/len
			List.append(data)
			return HttpResponse(json.dumps(List))
		except Exception as err:
			print(err)
			return HttpResponse("nima")
	else:
		try:
			stname = req['stname']
			stterm = req['stterm']
			studentId = Student.objects.get(StuName = stname)
			score = Score.objects.filter(StuNumId = studentId,Term = stterm)
			ScoreVal = 0
			length = 0
			for obj in score:
				ScoreVal = ScoreVal+obj.Score
				length = length+1
			score = ScoreVal/length
			return HttpResponse(score)
		except Exception as err:
			print(err)
			return HttpResponse("nima")
	