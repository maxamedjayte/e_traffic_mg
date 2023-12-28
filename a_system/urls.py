from django.urls import path
from . import views
urlpatterns = [

    path('login/',views.adminLoginPage),
    path('logout/',views.adminLogoutPage),

    path('',views.dashboard),
    path('car-reg/',views.carReg),
    path('user-reg/',views.userReg),
    path('fine-reg/',views.fineReg),
    path('carFines-reg/',views.carFinesReg),
    path('fines_report/',views.finesReport),

    # cars-info
    path('cars-info/',views.carsInfo),
    path('users-info/',views.usersInfo),
    path('all_reg_fines/',views.allRegFines),
    path('carFines-info/',views.carFinesInfo),


    # detail
    path('usrDetail/<str:pk>/',views.usrDetail),
    path('crInfo/<str:pk>/',views.crInfo)

    
    # path('crInfo/<str:pk>/',views.crInfo)
]