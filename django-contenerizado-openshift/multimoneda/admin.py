from django.contrib import admin

from multimoneda.models import Tasas
admin.site.site_header = ""

@admin.register(Tasas)
class TasasAdmin(admin.ModelAdmin):
    list_display = ('fuente','mon_num','mon_den','fecha','item', 'idfuente','tasa','hora','medio','textorg','cambiopor','cambioabs')
    ordering = ('-fecha',)
    search_fields = ('fuente','mon_num','mon_den','fecha')
    list_display_links = ('fuente','mon_num','mon_den','fecha','item', 'idfuente','tasa','hora','medio','textorg','cambiopor','cambioabs')
    list_filter = ('fuente','mon_num','mon_den','fecha')
    list_per_page = 10
    date_hierarchy = 'fecha'
