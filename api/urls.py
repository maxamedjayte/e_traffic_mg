from django.urls import path
from . import views
urlpatterns = [
    # user request
    path('user-list/',views.userList),
    path('user-create/',views.userCreate),
    path('user-update/<str:pk>/',views.userUpdate),
    path('user-delete/<str:pk>/',views.userDelete),
    path('user-detail/<str:pk>/',views.userDetail),
    path('user-password-format/<str:pk>/',views.passwordFormat),
    path('checkingUserExist/<str:username>/',views.checkingUserExist), 

    # UserProfile registring
    path('userProfile-list/',views.userProfileList),
    path('userProfile-create/',views.userProfileCreate),
    path('userProfile-update/<str:pk>/',views.userProfileUpdate),
    path('userProfile-delete/<str:pk>/',views.userProfileDelete),
    path('userProfile-detail/<str:pk>/',views.userProfileDetail),


    # Car registring
    path('car-list/',views.carList),
    path('car-create/',views.carCreate),
    path('car-update/<str:pk>/',views.carUpdate),
    path('car-delete/<str:pk>/',views.carDelete),
    path('car-detail/<str:pk>/',views.carDetail),
    path('checkingCarPlateExist/<str:carPlate>/',views.checkingCarPlateExist),

    # car fines
    path('carFines-list/',views.carFinesList),
    path('carFines-create/',views.carFinesCreate),
    path('carFines-update/<str:pk>/',views.carFinesUpdate),
    path('carFines-delete/<str:pk>/',views.carFinesDelete),
    path('carFines-detail/<str:pk>/',views.carFinesDetail),

    # report
    path('report-list/',views.reportList),
    path('report-create/',views.reportCreate),
    path('report-update/<str:pk>/',views.reportUpdate),
    path('report-delete/<str:pk>/',views.reportDelete),
    path('report-detail/<str:pk>/',views.reportDetail),

    
    # report
    path('fine-list/',views.fineList),
    path('fine-create/',views.fineCreate),
    path('fine-update/<str:pk>/',views.fineUpdate),
    path('fine-delete/<str:pk>/',views.fineDelete),
    path('fine-detail/<str:pk>/',views.fineDetail),

    
    # emer
    path('emerg-list/',views.emergList),
    path('emerg-create/',views.emergCreate),
    path('emerg-update/<str:pk>/',views.emergUpdate),
    path('emerg-delete/<str:pk>/',views.emergDelete),
    path('emerg-detail/<str:pk>/',views.emergDetail),

    
    # path('emerg-detail/<str:pk>/',views.emergDetail),
    # path('emerg-detail/<str:pk>/',views.emergDetail),



]