from django.db.models.query import QuerySet
from django.http.response import HttpResponseRedirect
from django.shortcuts import redirect, render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin
from mixins.custom_test_mixin import CustomTestMixin
from .models import Categoria, Libro
from apps.opiniones.forms import OpinionForm
from apps.opiniones.models import Opinion
from django.core.paginator import Paginator
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

# Create your views here.
# ------- Categorias -----------------

class CrearCategoria(LoginRequiredMixin,CustomTestMixin, CreateView):
    model = Categoria
    fields = ['nombre']
    template_name = 'libros/agregar_categoria.html'
    success_url = reverse_lazy('index')

class ActualizarCategoria(UpdateView, CustomTestMixin):
    model = Categoria
    fields = ['nombre']
    template_name = 'libros/agregar_categoria.html'
    success_url = reverse_lazy('index')

class EliminarCategoria(DeleteView, CustomTestMixin):
    model = Categoria
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('index')

# ------- Libros -----------------

class CrearLibro(CreateView , CustomTestMixin):
    model = Libro
    fields = ['titulo','autor','descripcion','categoria','imagen']
    template_name = 'libros/agregar_libro.html'
    success_url = reverse_lazy('index')

class ActualizarLibro(UpdateView , CustomTestMixin):
    model = Libro
    fields = ['titulo','autor','descripcion','categoria','imagen']
    template_name = 'libros/agregar_libro.html'
    success_url = reverse_lazy('index')

class EliminarLibro(DeleteView, CustomTestMixin):
    model = Libro
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('index')

class ListarLibros(ListView):
    model = Libro
    template_name = 'libros/listar_libros.html'
    context_object_name = 'libros'
    paginate_by = 3  # Número de libros por página

    def get_context_data(self) :
        context=super().get_context_data()
        categorias = Categoria.objects.all()
        context["categorias"] = categorias
        return context
    
    def get_queryset(self):
        query = self.request.GET.get('buscador')
        queryset= super().get_queryset()

        if query:
            queryset = queryset.filter(titulo__icontains=query)
        
        return queryset.order_by('titulo')

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render
from .models import Libro, Categoria

def listar_libro_por_categoria(request, categoria):
    # Filtrar los libros por la categoría seleccionada
    libros = Libro.objects.filter(categoria__nombre=categoria)

    # Paginación: definimos cuántos libros queremos por página
    paginator = Paginator(libros, 3)  # Muestra 3 libros por página
    page = request.GET.get('page')  # Obtén el número de la página actual desde la URL

    try:
        libros_paginados = paginator.page(page)
    except PageNotAnInteger:
        # Si la página no es un número, muestra la primera página
        libros_paginados = paginator.page(1)
    except EmptyPage:
        # Si la página está fuera de rango, muestra la última página de resultados
        libros_paginados = paginator.page(paginator.num_pages)

    # Renderizar el template con los libros paginados
    return render(request, 'libros/listar_libros.html', {
        'libros': libros_paginados,  # Libros paginados
        'categoria_seleccionada': categoria,  # Para destacar la categoría seleccionada
        'is_paginated': True,  # Control de paginación
        'page_obj': libros_paginados,  # Manejo de la paginación en la plantilla
        'categorias': Categoria.objects.all()  # Para mostrar todas las categorías en el dropdown
    })


def detalle_libro(request,id):
    libro = Libro.objects.get(id = id)
    opiniones = Opinion.objects.filter(libro = id)
    form = OpinionForm(request.POST)

    if form.is_valid():
        if request.user.is_authenticated:
            aux = form.save(commit=False)
            aux.libro = libro
            aux.usuario = request.user
            aux.save()
            form = OpinionForm()
        else:
            return redirect('apps.blog_auth:iniciar_sesion')

    context= {
        "libro": libro,
        "form" : form, 
        "opiniones" : opiniones
    }
    template_name = "libros/libro_detalle.html"

    return render(request, template_name=template_name,context=context)



def ordenar_por(request, criterio):
    # Ordenar por criterio recibido
    if criterio == 'fecha':
        libros = Libro.objects.all().order_by('fecha_agregado')
    elif criterio == 'titulo':
        libros = Libro.objects.all().order_by('titulo')
    elif criterio == 'categoria':
        libros = Libro.objects.all().order_by('categoria')
    else:
        libros = Libro.objects.all()

    # Paginación: definimos cuántos libros queremos por página
    paginator = Paginator(libros, 3)  # Muestra 3 libros por página
    page = request.GET.get('page')  # Obtén el número de la página actual desde la URL

    try:
        libros_paginados = paginator.page(page)
    except PageNotAnInteger:
        # Si la página no es un número, muestra la primera página
        libros_paginados = paginator.page(1)
    except EmptyPage:
        # Si la página está fuera de rango, muestra la última página de resultados
        libros_paginados = paginator.page(paginator.num_pages)

    # Renderizar el template con libros paginados
    return render(request, 'libros/listar_libros.html', {
        'libros': libros_paginados,  # Libros paginados
        'criterio': criterio,  # Para mostrar el criterio seleccionado
        'is_paginated': True,  # Para controlar si hay paginación
        'page_obj': libros_paginados  # Para manejar la paginación en la plantilla
    })