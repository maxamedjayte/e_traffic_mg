from email.policy import default
from xmlrpc.client import DateTime
from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class UserProfile(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE)
    prfileImage=models.ImageField(upload_to='profile',null=True,blank=True)
    fullName=models.CharField(max_length=255)
    password=models.CharField(max_length=255)
    number=models.CharField(max_length=12)
    address=models.CharField(max_length=255,null=True,blank=True)
    job=models.CharField(max_length=255,null=True,blank=True)
    userType=models.CharField(max_length=20)
    dateReg=models.DateTimeField(auto_now=True)
    info=models.TextField(null=True,blank=True)
    def __str__(self) -> str:
        return str(self.fullName) +' '+str(self.number)

class Car(models.Model):
    name=models.CharField(max_length=255)
    plateNo=models.CharField(max_length=255)
    image=models.ImageField(upload_to='car',null=True,blank=True)
    theOwner=models.ForeignKey(UserProfile,on_delete=models.CASCADE)
    dateTimeReg=models.DateTimeField()
    desc=models.TextField(max_length=255)
    def __str__(self) -> str:
        return str(self.plateNo) +' '+str(self.theOwner.fullName)




class FinesReg(models.Model):
    fineTitle=models.CharField(max_length=255)
    price=models.FloatField(default=0)
    info=models.TextField()

class Fines(models.Model):
    theCar=models.ForeignKey(Car,on_delete=models.CASCADE)
    theOwner=models.ForeignKey(UserProfile,on_delete=models.CASCADE,null=True,blank=True)
    dateTimeReg=models.DateTimeField()
    imageArea=models.ImageField(upload_to='finesImage',null=True,blank=True)
    desc=models.TextField()
    theFine=models.ForeignKey(FinesReg,on_delete=models.CASCADE)
    fixed=models.BooleanField(default=False)
    balance=models.FloatField(default=0)
    paided=models.BooleanField(default=False)
    def __str__(self) -> str:
        return self.theCar.name


class Report(models.Model):
    title=models.CharField(max_length=255)
    info=models.TextField(null=True,blank=True)
    dateTimeTr=models.DateTimeField(auto_now=True)


class EmergencyNote(models.Model):
    title=models.CharField(max_length=255)
    carName=models.CharField(max_length=255,null=True,blank=True)
    carPlate=models.CharField(max_length=255,null=True,blank=True)
    imageArea=models.ImageField(upload_to='emergencyImages',null=True,blank=True)
    desc=models.TextField(null=True,blank=True)
    dateR=models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.carName + self.carName + self.carPlate 