# -*- coding: utf-8 -*-

# import from apps here


# import from lib
# ===============================================================================
from django.contrib import admin
# from apps.__.models import aaaa
#
# admin.site.register(aaaa)
# ===============================================================================
from models import Scripts

# Register your models here.
admin.site.register(Scripts)