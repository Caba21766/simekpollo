from django.shortcuts import render, get_object_or_404
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from .models import Modulo1

# ------- CBV (Class-Based Views) -----------------
class CrearRegistro(CreateView):
    model = Modulo1
    fields = ['nombre', 'descripcion']
    template_name = 'modulo1/agregar_registro.html'
    success_url = reverse_lazy('index')

class ActualizarRegistro(UpdateView):
    model = Modulo1
    fields = ['nombre', 'descripcion']
    template_name = 'modulo1/actualizar_registro.html'
    success_url = reverse_lazy('index')

class EliminarRegistro(DeleteView):
    model = Modulo1
    template_name = 'modulo1/confirma_eliminar.html'
    success_url = reverse_lazy('index')

# -------- FBV (Function-Based Views) ---------------
def mostrar_registros(request):
    registros = Modulo1.objects.all()
    contexto = {
        'registros': registros  # Corregido 'regitros' a 'registros'
    }
    template = 'modulo1/listar_registros.html'
    return render(request=request, template_name=template, context=contexto)

def mostrar_registro_by_id(request, id):
    registro = get_object_or_404(Modulo1, id=id)  # Usamos get_object_or_404 para manejar el caso en que no exista el objeto
    contexto = {
        'registro': registro  # Corregido 'regitro' a 'registro'
    }
    template = 'modulo1/detalle_modulo.html'
    return render(request=request, template_name=template, context=contexto)

def index(request):
    return render(request, 'index.html')

def formulario(request):
    return render(request, 'modulo1/formulario.html')  
from django.shortcuts import render

def nosotros(request):
    return render(request, 'modulo1/nosotros.html')  

