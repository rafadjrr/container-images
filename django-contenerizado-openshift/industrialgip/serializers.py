from django.contrib.auth.models import User, Group
from rest_framework import serializers
from .models import Empresa, TP, Linea, Turno, MateriaPrima, Programado, DiarioProd, DiarioMP

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']

class EmpresaSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Empresa
        fields = ('__all__')

class TPSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = TP
        fields = ('__all__')

class LineaSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Linea
        fields = ('__all__')

#class TurnoSerializer(serializers.HyperlinkedModelSerializer):
class TurnoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Turno
        fields = ('__all__')

class MateriaPrimaSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = MateriaPrima
        fields = ('__all__')

class ProgramadoSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Programado 
        fields = ('__all__')

class DiarioProdSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = DiarioProd
        fields = ('__all__')

class DiarioMPSerializer(serializers.HyperlinkedModelSerializer):
    class meta:
        model = DiarioMP
        fields = ('__all__')

