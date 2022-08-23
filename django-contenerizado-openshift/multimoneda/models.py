from __future__ import unicode_literals
from django.db import models
# Create your models here

class Tasas(models.Model):
    fuente = models.CharField(null=True,blank=True,max_length=32)
    mon_num = models.CharField(null=True,blank=True,max_length=5, verbose_name='moneda numerador')
    mon_den = models.CharField(null=True,blank=True,max_length=5,verbose_name='moneda denominador')
    fecha = models.DateField(null=True,blank=True)
    item = models.PositiveSmallIntegerField(null=True,blank=True)
    idfuente = models.CharField(max_length=30,null=True,blank=True)
    tasa = models.DecimalField(null=True,blank=True,decimal_places=2,max_digits=5)
    hora = models.CharField(null=True,blank=True,max_length=16)
    medio = models.CharField(null=True,blank=True,max_length=16)
    textorg= models.CharField(null=True,blank=True,max_length=256,verbose_name='texto original')
    cambiopor = models.DecimalField(null=True,blank=True,verbose_name='cambio porcentual',decimal_places=2,max_digits=5)
    cambioabs = models.DecimalField(null=True,blank=True, verbose_name='cambio absoluto',decimal_places=2,max_digits=5)
    timestamp = models.DateTimeField(auto_now_add=True,editable=False)
    def __str__(self):
        texto = " Tasa {0} {1}/{2} fecha ({3}) fuente {4} item {5} "
        return texto.format(self.tasa, self.mon_num, self.mon_den, self.fecha, self.fuente, self.item)
    class Meta:
        verbose_name_plural = 'Tasas'
