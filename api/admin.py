from django.contrib import admin
from api.models import *

# Register your models here.
admin.site.register(UserProfile)
admin.site.register(Car)
admin.site.register(Fines)
admin.site.register(EmergencyNote)
admin.site.register(FinesReg)