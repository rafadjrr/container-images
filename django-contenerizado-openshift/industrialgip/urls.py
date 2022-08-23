from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from industrialgip import views

urlpatterns = [
    #path('user/', views.UserViewSet.as_view()),
    #path('group/', views.GroupViewSet),
    #ath('turnos/<int:pk>/', views.TurnoDetail.as_view()),
    path('turnos/', views.TurnoList.as_view()),
    path('turnos/<int:pk>/', views.TurnoDetail.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)