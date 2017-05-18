#!/usr/bin/env python
# coding: utf-8

import os
import sys

# 将系统的编码设置为UTF8
reload(sys)
sys.setdefaultencoding('utf8')

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "teacher.settings")

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
#from django.core.handlers.wsgi import get_wsgi__application #不同版本的不同
#application = get_wsgi__application


