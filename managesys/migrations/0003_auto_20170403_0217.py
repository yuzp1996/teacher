# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-04-03 02:17
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('managesys', '0002_auto_20161227_1328'),
    ]

    operations = [
        migrations.AlterField(
            model_name='class',
            name='ClassId',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]
