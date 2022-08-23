from __future__ import unicode_literals
from django.contrib.auth.models import User, Group
from django.http import Http404, HttpResponse, JsonResponse
from rest_framework import permissions,viewsets,generics,filters,status
from django_filters.rest_framework import DjangoFilterBackend, OrderingFilter
from rest_framework.response import Response
import datetime as dt

import push.syncdb as mt
import push.twitter as pushtwitter
import push.bcv as pushbcv
from multimoneda.models import Tasas
from multimoneda.serializers import *

class TasaListCreateAPIView(generics.ListCreateAPIView):
    serializer_class = TasasSerializer
    queryset = Tasas.objects.all().order_by('-id')
    # FILTROS
    filter_backends = [DjangoFilterBackend,filters.SearchFilter]
    search_fields = ['id',]
    filterset_fields = {
        'fuente':['icontains'],
        'mon_den':['icontains'],
        'mon_num':['icontains'],
        'fecha':['gte','lte','icontains'],
        'hora':['icontains'],
        'item':['gte','lte'],
        'tasa':['gte','lte','icontains'],
    }
    def list(self,request):
        queryset = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(queryset,many=True)
        try:
            return Response({'message': 'registros existentes','status':'RECENT IN DB','results':serializer.data},status=status.HTTP_200_OK)
        except Exception as e:
            return Response({'message': 'No existen tasas registradas!,','status':'NO RECORDS'},status=status.HTTP_204_NO_CONTENT)
    def post(self, request):
        serializer = self.serializer_class(data = request.data)
        #serializer = self.serializer_class(data = payload)
        #print(serializer)
        if serializer.is_valid():
            serializer.save()
            return Response({'message': 'Se agrego un nuevo registro a la bd','status':'ADDED','results':serializer.data},status=status.HTTP_201_CREATED)
        return Response({'message': 'error','status':'BAD REQUEST','results':{'items':serializer.errors}},status=status.HTTP_400_BAD_REQUEST)
    
class TasasRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Tasas.objects.all()    
    serializer_class = TasasSerializer
    def get_object(self):
        pfecha = self.kwargs["pfecha"]
        fec=pfecha.split('-')
        fec[1]=fec[1].zfill(2)
        fec[2]=fec[2].zfill(2)
        pfecha='-'.join(fec)
        pfuente = self.kwargs["pfuente"]
        pden = self.kwargs["pden"]
        pnum = self.kwargs["pnum"]
        #return Tasas.objects.get(fecha=pfechaParam,fuente__icontains=pfuente,mon_den__icontains=pden,mon_num__icontains=pnum)
        try:
            return self.queryset.filter(fecha__icontains=pfecha,fuente__icontains=pfuente,mon_den__icontains=pden,mon_num__icontains=pnum).latest('id')
        except Tasas.DoesNotExist:
            raise Http404

def TasasPush(request,modo,fuente,num,den):
    # push a todas las tasas
    if modo == 0:
        try:
            pushtwitter.capturarSinParametros()
            pushbcv.capturaTodas()
            response_data = mt.GET_List()
            return HttpResponse(response_data,content_type = "application/json")
        except Exception as e:
            error = str(e)
            response_data = JsonResponse({"message":"Algo ocurre en el servidor destino","error":error})
            return response_data
    # push a las tasas parametrizadas
    elif modo == 1:
        if fuente == 'monitordolarvla':
            try:
                response_data = pushtwitter.capturarRecientes(fuente,num,den)
                return HttpResponse(response_data,content_type = "application/json")
                #if pushtwitter.capturarRecientes(fuente,num,den) == False:
                #    resultado = "<H1> Se agrego uno o mas registros nuevos, Success! </H1>"
                #    return HttpResponse(resultado)
                #else:
                ##    resultado = "<H1> No se agregó un nuevo registro a la bd y existe al menos 1 registro! </H1>"
                #    return HttpResponse(resultado)
            except Exception as e:
                error = str(e)
                response_data = JsonResponse({"message":"Algo ocurre en el servidor destino","error":error})
                return response_data
        elif fuente == 'bcv':
            try:
                response_data = pushbcv.capturaUna(fuente,num,den)
                return HttpResponse(response_data,content_type = "application/json")
            except Exception as e:
                error = str(e)
                response_data = JsonResponse({"message":"Algo ocurre en el servidor destino","error":error})
                return response_data
        else:
            error = "parametro '" + fuente + "' no admitido"
            response_data = JsonResponse({"message":"bad request, las fuentes admitidas son 'bcv','monitordolarvla'","error":error})
            return response_data
    else:
        error = "parametro '" + str(modo) + "' no admitido"
        response_data = JsonResponse({"message":"bad request, los modos admitidos son | '0' -> inserts en general | '1' -> inserts parametrizados |","error":error})
        return response_data