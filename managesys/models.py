# -*- coding: utf-8 -*-
from django.contrib import admin
from django.db import models

# Create your models here.
class Class(models.Model):
	ClassId = models.AutoField(primary_key=True)
	ClassName = models.CharField(max_length = 10)
	def __unicode__(self):
		return unicode(self.ClassName) or u''
	class Meta:
		db_table = 'Class'

class Student(models.Model):
	StuNumId = models.CharField(primary_key=True,max_length = 10)#学号
	StuName = models.CharField(max_length = 10)#学生姓名
	ClassId = models.ForeignKey(Class,db_column = 'ClassId')
	Sex = models.BooleanField(default = 1)#1代表男

	def __unicode__(self):
		return unicode(self.StuName) or u'' 

	class Meta:
		db_table = 'Student'


class Course(models.Model):
	CourseId = models.AutoField(primary_key = True)
	CourseName = models.CharField(max_length=20)


	def __unicode__(self):
		return unicode(self.CourseName) or u''

	class Meta:
		db_table = 'Course'


class Teacher(models.Model):
	TeacherId = models.CharField(primary_key=True,max_length = 10)#教师编号
	TeacherName = models.CharField(max_length = 10)#教师姓名
	Sex = models.BooleanField(default = 1)#1代表男
	CourseId = models.ForeignKey(Course,db_column = 'CourseId')
	
	def __unicode__(self):
		return unicode(self.TeacherName) or u'' 	
	class Meta:
		db_table = 'Teacher'


class Score(models.Model):
	ScoreId = models.AutoField(primary_key = True)
	CourseId = models.ForeignKey(Course,db_column = 'CourseId')
	StuNumId = models.ForeignKey(Student,db_column = 'StuNumId')
	Term = models.IntegerField()
	Score = models.IntegerField()
	def __unicode__(self):
		return unicode(self.ScoreId) or u''

	class Meta:
		db_table = 'Score'




