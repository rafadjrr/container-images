from django.contrib.auth.models import User, Group
from rest_framework import serializers
from .models import Tasas

class TasasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tasas
        fields = ('__all__')