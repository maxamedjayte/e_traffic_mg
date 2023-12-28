from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect

from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required
from sqlalchemy import null
from api.models import *
from api.models import UserProfile

def adminLoginPage(request):
    status=''
    if request.POST:
        username=request.POST.get('username')
        password=request.POST.get('password')
        try:
            if User.objects.get(username=username).is_superuser:
                user = authenticate(request,username=username,password=password)
                if user is not None:
                    login(request,user)
                    return redirect('/')
                else:
                    status='Username Or Password Is Wrong'
            else:
                status='wrong admin username'
                data={
                    'status':status
                }
                return render(request,'normal_pages/login.html',data)
        except:
            status='Username Or Password Is Wrong'
    data={
        'status':status
    }
    return render(request,'normal_pages/login.html',data)

def adminLogoutPage(request):
    logout(request)
    return HttpResponseRedirect('/login/')



# regestration info
@login_required(login_url='/login/')
def dashboard(request):
    cars=Car.objects.all().count()
    emerg=EmergencyNote.objects.all()
    users=UserProfile.objects.all().count()
    reports=Report.objects.all().order_by('dateTimeTr')
    fines=Fines.objects.all().order_by('dateTimeReg')

    return render(request,'normal_pages/dashboard.html',{'cars':cars,'fines':fines,'users':users,'reports':reports,'emergNote':emerg})

@login_required(login_url='/login/')
def carReg(request):
    return render(request,'reg_mang/car_reg.html')

@login_required(login_url='/login/')
def userReg(request):
    return render(request,'reg_mang/user_reg.html')

@login_required(login_url='/login/')
def fineReg(request):
    return render(request,'reg_mang/fine_reg.html')

@login_required(login_url='/login/')
def carFinesReg(request):
    return render(request,'reg_mang/car_fines.html')

@login_required(login_url='/login/')
def finesReport(request):
    return render(request,'manage/fines_report.html')

# manage

@login_required(login_url='/login/')
def carsInfo(request):
    return render(request,'manage/cars_info.html')

@login_required(login_url='/login/')
def usersInfo(request):
    return render(request,'manage/users_info.html')

@login_required(login_url='/login/')
def allRegFines(request):
    return render(request,'manage/all_reg_fines.html')


@login_required(login_url='/login/')
def carFinesInfo(request):
    return render(request,'manage/all_fines.html')




# detail
@login_required(login_url='/login/')
def usrDetail(request,pk):
    theUser=UserProfile.objects.get(pk=pk)
    cars=Car.objects.filter(theOwner=pk)
    fines=Fines.objects.filter(theOwner=pk)
    return render(request,'detail/user_profile.html',{'pk':pk,'fines':fines,'userCars':cars,'theUser':theUser})

    
@login_required(login_url='/login/')
def crInfo(request,pk):
    theUser=UserProfile.objects.get(pk=pk)
    cars=Car.objects.get(pk=pk)
    fines=Fines.objects.filter(theOwner=pk)
    return render(request,'detail/car_profile.html',{'pk':pk,'fines':fines,'userCars':cars,'theUser':theUser})




# context
# @login_required(login_url='/login/')
def userProfileInfo(request):
    print(request.user)
    if(request.user.pk==None):
        return {
            'userInfo':{}
        }
    elif(request.user.pk==null):
        return {
                'userInfo':{}
            }
    else:
        if(UserProfile.objects.filter(user=User.objects.get(pk=request.user.id)).exists()==True):
            print('exits')
            return {
                'userInfo': UserProfile.objects.get(user=User.objects.get(pk=request.user.id))
            }
        else:
            return {
                'userInfo': ''
            }
        