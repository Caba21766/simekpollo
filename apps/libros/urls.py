from django.urls import path

from prueba1 import settings
from .views import (CrearCategoria, ActualizarCategoria, EliminarCategoria, 
                    CrearLibro, ActualizarLibro, ListarLibros, EliminarLibro, 
                    detalle_libro, listar_libro_por_categoria, ordenar_por)

from django.conf import settings
from django.conf.urls.static import static

app_name = 'apps.libros'

urlpatterns = [
    path("agregar_categoria/", CrearCategoria.as_view(), name='agregar_categoria'),
    path("actualizar_categoria/<int:pk>", ActualizarCategoria.as_view(), name='actualizar_categoria'),
    path("eliminar_categoria/<int:pk>", EliminarCategoria.as_view(), name='eliminar_categoria'),
    path("agregar_libro/", CrearLibro.as_view(), name='agregar_libro'),
    path("actualizar_libro/<int:pk>", ActualizarLibro.as_view(), name='actualizar_libro'),
    path("eliminar_libro/<int:pk>", EliminarLibro.as_view(), name='eliminar_libro'),
    path("listar_libros/", ListarLibros.as_view(), name='listar_libros'),
    path("libro/<int:id>", detalle_libro, name='libro'),
    path("listar_por_categoria/<str:categoria>", listar_libro_por_categoria, name='listar_por_categoria'),
    path('ordenar_por/<str:criterio>/', ordenar_por, name='ordenar_por'),  # Solo deja esta
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)