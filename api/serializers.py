from django.contrib.auth.models import User
from rest_framework import serializers

from .models import *


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields='__all__'

class UserProfileSerializer(serializers.ModelSerializer):
    username=serializers.ReadOnlyField(source='user.username')
    class Meta:
        model=UserProfile
        fields='__all__'

class CarSerializer(serializers.ModelSerializer):
    ownerName=serializers.ReadOnlyField(source='theOwner.fullName')
    ownerNumber=serializers.ReadOnlyField(source='theOwner.number')
    class Meta:
        model=Car
        fields='__all__'

class CarFinesSerializer(serializers.ModelSerializer):
    fineTitle=serializers.ReadOnlyField(source='theFine.fineTitle')
    penallyMoney=serializers.ReadOnlyField(source='theFine.price')
    carName=serializers.ReadOnlyField(source='theCar.name')
    carTargo=serializers.ReadOnlyField(source='theCar.plateNo')
    carImage=serializers.ReadOnlyField(source='theCar.image.url')
    ownerName=serializers.ReadOnlyField(source='theOwner.fullName')
    ownerImage=serializers.ReadOnlyField(source='theOwner.prfileImage.url')
    ownerType=serializers.ReadOnlyField(source='theOwner.userType')
    ownerNumber=serializers.ReadOnlyField(source='theOwner.number')
    class Meta:
        model=Fines
        fields='__all__'

        
class FinesReportSerializer(serializers.ModelSerializer):
    # carName=serializers.ReadOnlyField(source='theCar.name')
    # ownerTargo=serializers.ReadOnlyField(source='theCar.plateNo')
    class Meta:
        model=Report
        fields='__all__'

class FinesRegSerializer(serializers.ModelSerializer):
    class Meta:
        model=FinesReg
        fields='__all__'

class EmergencyNoteSerializer(serializers.ModelSerializer):
    class Meta:
        model=EmergencyNote
        fields='__all__'
