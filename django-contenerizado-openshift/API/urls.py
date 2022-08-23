from django.urls import include, path
from django.conf.urls import url,include
from rest_framework import routers
from django.views.static import serve
from django.conf import settings
from django.contrib import admin

routerm = routers.DefaultRouter()
#routerm.register(r'tasas', viewsmulti.TasasViewSet)
# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
#    path('', views.index, name='index'),
    path(r'admin/', admin.site.urls),
    path('industrialgip/', include('industrialgip.urls')),
    path('multimoneda/', include('multimoneda.urls')),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^img/(?P<path>.*)$',serve,{'document_root':settings.MEDIA_ROOT},),
    url(r'^registro/', include('rest_auth.registration.urls')),
]