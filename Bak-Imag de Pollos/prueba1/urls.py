"""
URL configuration for prueba1 project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.contrib import admin
from django.urls import include, path
from django.urls import path
from . import views
from .views import HomeView
from django.urls import path, include


urlpatterns = [
    path("admin/", admin.site.urls),
    path("", HomeView.as_view() , name='index' ),
    path("libros/", include('apps.libros.urls')),
    path("users/", include('apps.blog_auth.urls')),
    path('formulario/', views.contacto_view, name='formulario'),
    path('gracias/', views.gracias_view, name='gracias'),
    path('nosotros/', views.nosotros_view, name='nosotros'),
    path('curriculom/', views.curriculom_view, name='curriculom'),
    path("opiniones/", include('apps.opiniones.urls')),

] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)

urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.STATIC_URL, document_root = settings.STATIC_ROOT)

#--------------------------------------------------------------------------------------
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)




    