from django.contrib import admin

# Register your models here
from .models import Empresa,TP,Linea,Turno,MateriaPrima,Programado,DiarioProd,DiarioMP

admin.site.register(Empresa)
admin.site.register(TP)
admin.site.register(Linea)
admin.site.register(Turno)

@admin.register(MateriaPrima)
class MateriaPrimaAdmin(admin.ModelAdmin):
    list_display = ('cod_arti','descripcion','empresadestino')
    ordering = ('-empresadestino',)
    search_fields = ('cod_arti','descripcion','empresadestino')
    list_display_links = ('cod_arti','descripcion','empresadestino')
    list_filter = ('cod_arti','descripcion','empresadestino')
    list_per_page = 10

class DiarioProdInline(admin.StackedInline):
    model = DiarioProd
    extra = 0
 
class DiarioMPInline(admin.StackedInline):
    model = DiarioMP
    extra = 0

@admin.register(Programado)
class ProgramadoAdmin(admin.ModelAdmin):
    inlines = [DiarioProdInline,DiarioMPInline]
    list_display = ('id','empresa','linea','tp','fecha', 'cantidadkg', 'estatus')
    ordering = ('-fecha',)
    search_fields = ('empresa__descripcion','linea__descripcion','tp__descripcion','estatus','fecha','cantidadkg')
    list_display_links = ('id','empresa','linea','tp','fecha', 'cantidadkg', 'estatus')
    list_filter = ('id','empresa','linea','tp','fecha', 'cantidadkg', 'estatus')
    list_per_page = 10
    date_hierarchy = 'fecha'

@admin.register(DiarioProd)
class DiarioProdAdmin(admin.ModelAdmin):
    list_display = ('Programado','turno','fecha','hora', 'kilosp', 'desperdicios','idrack','observaciones')
    ordering = ('-fecha',)
    search_fields = ('orden__id','turno__descripcion','fecha','cantidadkg','idrack','observaciones')
    list_display_links = ('Programado','turno','fecha','hora', 'kilosp', 'desperdicios','idrack','observaciones')
    list_filter = ('Programado','turno','fecha','hora', 'kilosp', 'desperdicios','idrack','observaciones')
    list_per_page = 10
#admin.site.register(DiarioProd)

@admin.register(DiarioMP)
class DiarioMPAdmin(admin.ModelAdmin):
    list_display = ('id','programado','turno','materiaprima', 'fecha', 'ingresokg','consumokg','inventariofinalkg','observaciones')
 #   ordering = ('-fecha',)
#    list_display_links = ('id','programado','turno', 'materiaprima','fecha','ingresokg','consumokg','inventariofinalkg','observaciones')
 #   list_filter = ('id','programado','turno', 'materiaprima','fecha','ingresokg','consumokg','inventariofinalkg','observaciones')
 #   list_per_page = 10
