# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('managesys', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Class',
            fields=[
                ('ClassId', models.AutoField(default=1, serialize=False, primary_key=True)),
                ('ClassName', models.CharField(max_length=10)),
            ],
            options={
                'db_table': 'Class',
            },
        ),
        migrations.AddField(
            model_name='student',
            name='ClassId',
            field=models.ForeignKey(db_column=b'ClassId', default=1, to='managesys.Class'),
            preserve_default=False,
        ),
    ]
