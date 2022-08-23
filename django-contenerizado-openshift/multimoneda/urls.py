from django.urls import path, re_path
from multimoneda import views

urlpatterns = [
    #path('user/', views.UserViewSet.as_view()),
    #path('group/', views.GroupViewSet),
    path('tasas/', views.TasaListCreateAPIView.as_view(), name='tasaslist'),
    #path('tasas/detail/<int:pk>/', views.TasasDetail.as_view(), name='tasasdetail'),
    path('tasas/today/fecha=<str:pfecha>&fuente=<str:pfuente>&denominador=<str:pden>&numerador=<str:pnum>/', views.TasasRetrieveUpdateDestroyAPIView.as_view(), name='tasadetail'),
    path('tasas/push/<int:modo>/<str:fuente>/<str:num>/<str:den>/', views.TasasPush, name='tasapush')
]