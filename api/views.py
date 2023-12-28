from django.shortcuts import render

from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render
from django.http import HttpResponse, response
from django.contrib.auth.models import User
from api.serializers import *
from django.contrib.auth.models import User
# Create your views here.
# Create your views here.
@api_view(['GET'])
def apiOverview(request):
    api_url={
        'Doc-List':'/doc-list/',
        'Doc-create':'doc-create/',
        'Delete':'',
    }
    return Response(api_url)



# user 
@api_view(['GET'])
def userList(request):
    user=User.objects.all()
    serializer=UserSerializer(user,many=True)
    return Response(serializer.data)

@api_view(['POST','GET'])
def userCreate(request):
    serializer=UserSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

def passwordFormat(request,pk):
    theUser=User.objects.get(pk=pk)
    theUser.set_password(theUser.password)
    theUser.save()
    return HttpResponse(theUser)
@api_view(['POST'])
def userUpdate(request,pk):
    user=User.objects.get(pk=pk)
    serializer=UserSerializer(instance=user,data=request.data,partial=True)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['DELETE'])
def userDelete(request,pk):
    theUser=User.objects.get(pk=pk)
    
    theUser.delete()
    return Response()

@api_view(['GET'])
def userDetail(request,pk):
    user=User.objects.get(pk=pk)
    serializer=UserSerializer(user,many=False)
    return Response(serializer.data)



@api_view(['GET'])
def checkingUserExist(request,username):
    userr=User.objects.filter(username=username).exists()
    # serializer=ClasseSerializer(classe,many=True)
    return Response({'isExist':userr})






# userProfile 
@api_view(['GET'])
def userProfileList(request):
    object=UserProfile.objects.all()
    serializer=UserProfileSerializer(object,many=True)
    return Response(serializer.data)

@api_view(['POST','GET'])
def userProfileCreate(request):
    serializer=UserProfileSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['POST'])
def userProfileUpdate(request,pk):
    object=UserProfile.objects.get(pk=pk)
    serializer=UserProfileSerializer(instance=object,data=request.data,partial=True)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['DELETE'])
def userProfileDelete(request,pk):
    theObject=UserProfile.objects.get(pk=pk)
    theObject.delete()
    return Response()

@api_view(['GET'])
def userProfileDetail(request,pk):
    object=UserProfile.objects.get(pk=pk)
    serializer=UserProfileSerializer(object,many=False)
    return Response(serializer.data)







# carRegister 
@api_view(['GET'])
def carList(request):
    object=Car.objects.all()
    serializer=CarSerializer(object,many=True)
    return Response(serializer.data)

@api_view(['POST','GET'])
def carCreate(request):
    serializer=CarSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['POST'])
def carUpdate(request,pk):
    theObject=Car.objects.get(pk=pk)
    serializer=CarSerializer(instance=theObject,data=request.data,partial=True)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['DELETE'])
def carDelete(request,pk):
    theObject=User.objects.get(pk=pk)
    
    theObject.delete()
    return Response()

@api_view(['GET'])
def carDetail(request,pk):
    theObject=Car.objects.get(pk=pk)
    serializer=CarSerializer(theObject,many=False)
    return Response(serializer.data)


@api_view(['GET'])
def checkingCarPlateExist(request,carPlate):
    exists=Car.objects.filter(plateNo=carPlate).exists()
    # serializer=ClasseSerializer(classe,many=True)
    return Response({'isExist':exists})







# carRegister 
@api_view(['GET'])
def carFinesList(request):
    object=Fines.objects.all().order_by('-fixed').order_by('dateTimeReg')
    serializer=CarFinesSerializer(object,many=True)
    return Response(serializer.data)

@api_view(['POST','GET'])
def carFinesCreate(request):
    serializer=CarFinesSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['POST'])
def carFinesUpdate(request,pk):
    theObject=Fines.objects.get(pk=pk)
    serializer=CarFinesSerializer(instance=theObject,data=request.data,partial=True)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['DELETE'])
def carFinesDelete(request,pk):
    theObject=Fines.objects.get(pk=pk)
    
    theObject.delete()
    return Response()

@api_view(['GET'])
def carFinesDetail(request,pk):
    theObject=Fines.objects.get(pk=pk)
    serializer=CarFinesSerializer(theObject,many=False)
    return Response(serializer.data)






@api_view(['GET'])
def reportList(request):
    object=Report.objects.all()
    serializer=FinesReportSerializer(object,many=True)
    return Response(serializer.data)

@api_view(['POST','GET'])
def reportCreate(request):
    serializer=FinesReportSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['POST'])
def reportUpdate(request,pk):
    theObject=Report.objects.get(pk=pk)
    serializer=FinesReportSerializer(instance=theObject,data=request.data,partial=True)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['DELETE'])
def reportDelete(request,pk):
    theObject=Report.objects.get(pk=pk)
    
    theObject.delete()
    return Response()

@api_view(['GET'])
def reportDetail(request,pk):
    theObject=Report.objects.get(pk=pk)
    serializer=FinesReportSerializer(theObject,many=False)
    return Response(serializer.data)




@api_view(['GET'])
def fineList(request):
    object=FinesReg.objects.all()
    serializer=FinesRegSerializer(object,many=True)
    return Response(serializer.data)

@api_view(['POST','GET'])
def fineCreate(request):
    serializer=FinesRegSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['POST'])
def fineUpdate(request,pk):
    theObject=FinesReg.objects.get(pk=pk)
    serializer=FinesRegSerializer(instance=theObject,data=request.data,partial=True)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['DELETE'])
def fineDelete(request,pk):
    theObject=FinesReg.objects.get(pk=pk)
    
    theObject.delete()
    return Response()

@api_view(['GET'])
def fineDetail(request,pk):
    theObject=FinesReg.objects.get(pk=pk)
    serializer=FinesRegSerializer(theObject,many=False)
    return Response(serializer.data)







@api_view(['GET'])
def emergList(request):
    object=EmergencyNote.objects.all()
    serializer=EmergencyNoteSerializer(object,many=True)
    return Response(serializer.data)

@api_view(['POST','GET'])
def emergCreate(request):
    serializer=EmergencyNoteSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['POST'])
def emergUpdate(request,pk):
    theObject=EmergencyNote.objects.get(pk=pk)
    serializer=EmergencyNoteSerializer(instance=theObject,data=request.data,partial=True)
    if serializer.is_valid():
        serializer.save()
        return Response({"status": "success", "data": serializer.data})
    else:
        return Response({"status": "error", "data": serializer.errors})

@api_view(['DELETE'])
def emergDelete(request,pk):
    theObject=EmergencyNote.objects.get(pk=pk)
    
    theObject.delete()
    return Response()

@api_view(['GET'])
def emergDetail(request,pk):
    theObject=EmergencyNote.objects.get(pk=pk)
    serializer=EmergencyNoteSerializer(theObject,many=False)
    return Response(serializer.data)


