from __future__ import unicode_literals

# Create your models here
from django.db import models
import datetime
CHOICE_EMPRESA=(
        ('1','Cordeleria'),
        ('2','Polybarq'),
        ('3','Andisacos')
    )
class Empresa(models.Model):
    descripcion = models.CharField(max_length=50,choices=CHOICE_EMPRESA, default='2')
    def __str__(self):
        return self.descripcion
    class Meta:
        verbose_name_plural = "empresa"

class TP(models.Model):
    cod_arti = models.CharField(primary_key=True,max_length=20)
    descripcion = models.CharField(max_length=50)
    def __str__(self):
        texto = "{0} {1}"
        return texto.format(self.cod_arti, self.descripcion)
    class Meta:
        verbose_name_plural = "Trama en Proceso"

class Linea(models.Model):
    descripcion = models.CharField(max_length=50)
    def __str__(self):
        return self.descripcion
    class Meta:
        verbose_name_plural = "Linea"

class Turno(models.Model):
    descripcion = models.CharField(max_length=50)
    horario = models.CharField(max_length=50)
    def __str__(self):
        texto = "{0} {1}"
        return texto.format(self.descripcion, self.horario)
    class Meta:
        verbose_name_plural = "Turno"

class MateriaPrima(models.Model):
    cod_arti = models.CharField(primary_key=True,max_length=20)
    descripcion = models.TextField()
    empresadestino = models.CharField(max_length=12)
    def __str__(self):
        texto = "{0} | empresa # {1}"
        return texto.format(self.descripcion, self.empresadestino)
    class Meta:
        verbose_name_plural = "Materia Prima"
STATUS = (
        ('PEND', 'Pendiente'),
        ('TERM', 'Terminado')
    )
class Programado(models.Model):
    empresa = models.ForeignKey(Empresa,on_delete=models.CASCADE)
    linea = models.ForeignKey(Linea,on_delete=models.CASCADE)
    tp = models.ForeignKey(TP ,on_delete=models.CASCADE)
    fecha = models.DateField(auto_now_add=True)
    cantidadkg = models.FloatField(default=0)
    estatus = models.CharField(max_length=4, choices=STATUS, default='PEND',editable=False)
    def __str__(self):       
        texto = "ORDEN:{0} linea: {1} fecha: {2} kg: {3} estatus: {4}"
        return texto.format(self.id, self.linea, self.fecha, self.cantidadkg, self.estatus)
    class Meta:
        verbose_name_plural = "Programado"

class DiarioProd(models.Model):
    Programado = models.ForeignKey(Programado, on_delete=models.CASCADE)
    turno = models.ForeignKey(Turno,on_delete=models.CASCADE)
    fecha =  models.DateField()
    hora = models.TimeField()
    kilosp = models.FloatField(default=0)
    desperdicios = models.IntegerField(default=0)
    idrack = models.IntegerField(blank=True)
    observaciones = models.TextField(max_length=256,blank=True)
    def __str__(self):
        texto = "DIARIOPROD#{0} fecha: {1} "
        return texto.format(self.id, self.fecha)
    class Meta:
        verbose_name_plural = "Diario de Produccion"

class DiarioMP(models.Model):
#   linea = models.ForeignKey(Linea,on_delete=models.CASCADE)
    programado = models.ForeignKey(Programado,on_delete=models.CASCADE)
    materiaprima = models.ForeignKey(MateriaPrima,on_delete=models.CASCADE)
    turno = models.ForeignKey(Turno,on_delete=models.CASCADE)
    fecha = models.DateField(auto_now_add=True)
    ingresokg = models.FloatField(default=0)
    consumokg = models.FloatField(default=0)
    inventariofinalkg = models.FloatField(default=0,null=True,editable=False)
    observaciones = models.TextField(max_length=256,blank=True,null=True)
    def __str__(self):
        texto = "DIARIOMP#{0} fecha: {1} "
        return texto.format(self.id, self.fecha)
    class Meta:
        verbose_name_plural = "Diario de materia prima"
    @property
    def resta_valores(self):
        return (self.ingresokg - self.consumokg)

    def save(self):
        self.inventariofinalkg = self.resta_valores
        super (DiarioMP, self).save()
