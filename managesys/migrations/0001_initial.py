# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Course',
            fields=[
                ('CourseId', models.AutoField(serialize=False, primary_key=True)),
                ('CourseName', models.CharField(max_length=20)),
            ],
            options={
                'db_table': 'Course',
            },
        ),
        migrations.CreateModel(
            name='Score',
            fields=[
                ('ScoreId', models.AutoField(serialize=False, primary_key=True)),
                ('Term', models.IntegerField()),
                ('Score', models.IntegerField()),
                ('CourseId', models.ForeignKey(to='managesys.Course', db_column=b'CourseId')),
            ],
            options={
                'db_table': 'Score',
            },
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('StuNumId', models.CharField(max_length=10, serialize=False, primary_key=True)),
                ('StuName', models.CharField(max_length=10)),
                ('Sex', models.BooleanField(default=1)),
            ],
            options={
                'db_table': 'Student',
            },
        ),
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('TeacherId', models.CharField(max_length=10, serialize=False, primary_key=True)),
                ('TeacherName', models.CharField(max_length=10)),
                ('Sex', models.BooleanField(default=1)),
                ('CourseId', models.ForeignKey(to='managesys.Course', db_column=b'CourseId')),
            ],
            options={
                'db_table': 'Teacher',
            },
        ),
        migrations.AddField(
            model_name='score',
            name='StuNumId',
            field=models.ForeignKey(to='managesys.Student', db_column=b'StuNumId'),
        ),
    ]
