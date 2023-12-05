from django.urls import path
from . import views
from .views import fazer_login
from .views import receber_inscricao
from django.contrib.auth.decorators import login_required

urlpatterns = [
    path('registrar_usuario/', views.registrar_usuario, name='registrar_usuario'),
    path('fazer_login/', views.fazer_login, name='fazer_login'),
    path('receber_inscricao/', views.receber_inscricao, name='receber_inscricao'),
    path('', views.envia_email,name='envia_email'),
]
