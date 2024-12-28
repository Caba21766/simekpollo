from django.urls import path
from . import views

app_name = 'apps.modulo1'

urlpatterns = [
    path('crear_registro/', views.CrearRegistro.as_view(), name='crear_registro'),
    path('actualiza_registro/<int:pk>', views.ActualizarRegistro.as_view(), name='actualizar_registro'),
    path('eliminar_registro/', views.EliminarRegistro.as_view(), name='eliminar_registro'),
    path('listar_registros/', views.mostrar_registros, name='mostrar_registros'),
    path('', views.index, name='index'),  # Ruta principal para la vista index
    path('formulario/', views.formulario, name='formulario'),  # Ruta para la vista formulario
    path('nosotros/', views.nosotros, name='nosotros'),  # Ruta para la vista nosotros
]
