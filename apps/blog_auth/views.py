from django.http import Http404
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse_lazy
from django.views.generic import FormView, UpdateView
from django.contrib.auth.views import LoginView
from django.contrib.auth.models import User
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from django.contrib.auth.decorators import login_required

from .forms import RegistrarseForm


#---------------------------------------------------------------------------#
from django.views.generic.edit import FormView

class RegistrarseView(FormView):
    template_name = 'users/registrarse.html'
    form_class = RegistrarseForm
    success_url = reverse_lazy('index')

    def form_valid(self, form):
        # Guardar el usuario
        user = form.save(commit=False)
        user.dni_usuario = form.cleaned_data['dni_usuario']
        user.domicilio_usuario = form.cleaned_data['domicilio_usuario']
        user.tel1_usuario = form.cleaned_data['tel1_usuario']
        user.tel2_usuario = form.cleaned_data.get('tel2_usuario')
        user.imagen_usuario = form.cleaned_data.get('imagen_usuario')
        user.save()

        messages.success(self.request, "Tu cuenta ha sido creada exitosamente.")
        return super().form_valid(form)

#---------------------------------------------------------------------------#

# Vista de inicio de sesión
class IniciarSesionView(LoginView):
    template_name = 'users/iniciar_sesion.html'


#---------------------------------------------------------------------------#

# Vista para la edición de perfil de usuario
class EditarPerfil(LoginRequiredMixin, UpdateView):
    model = User
    form_class = RegistrarseForm
    template_name = 'users/registrarse.html'
    success_url = reverse_lazy('index')

    def get_object(self, queryset=None):
        return get_object_or_404(User, pk=self.request.user.pk)

    def dispatch(self, request, *args, **kwargs):
        user_id = self.kwargs.get('pk')
        if str(user_id) != str(request.user.pk):
            raise Http404("No tienes permiso para editar este perfil.")
        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        user = form.save()
        imagen = form.cleaned_data.get('imagen')

        # Actualizar el perfil con la nueva imagen si se proporciona
        profile, created = Profile.objects.get_or_create(user=user)
        if imagen:
            profile.imagen = imagen
            profile.save()

        messages.success(self.request, "Perfil actualizado correctamente.")
        return super().form_valid(form)

#---------------------------------------------------------------------------#

# Vista para mostrar el perfil del usuario
from django.shortcuts import render
from .models import Profile

def perfil_view(request):
    user_profile = Profile.objects.get(user=request.user)  # Obtener el perfil del usuario autenticado
    return render(request, 'users/perfil.html', {'user_profile': user_profile})


#---------------------------------------------------------------------------#
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
#from .models import Profile
from .forms import EditarUsuarioForm

@login_required
def editar_usuario(request, pk):
    # Obtener el usuario o lanzar un 404 si no existe
    usuario = get_object_or_404(User, pk=pk)
    # Obtener el perfil asociado al usuario
    user_profile = get_object_or_404(Profile, user=usuario)

    if request.method == 'POST':
        form = EditarUsuarioForm(request.POST, request.FILES, instance=usuario)
        if form.is_valid():
            form.save()
            # Guardar la imagen de perfil
            if 'imagen' in request.FILES:
                user_profile.imagen = request.FILES['imagen']
                user_profile.save()
            return redirect('apps.blog_auth:perfil')  # Redirigir al perfil después de guardar
    else:
        form = EditarUsuarioForm(instance=usuario)

    return render(request, 'users/editar_usuario.html', {
        'form': form,
        'user_profile': user_profile,
    })



#---------------------------------------------------------------------------#

from django.shortcuts import render
from django.contrib.auth.models import User

def lista_usuarios(request):
    usuarios = User.objects.all()
    return render(request, 'blog_auth/lista_usuarios.html', {'usuarios': usuarios})



#---------------------------------------------------------------------------#
from django.views.generic import TemplateView
#from .models import Profile

class TuVista(TemplateView):
    template_name = 'tu_template.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['user_profile'] = Profile.objects.get(user=self.request.user)
        return context


#---------------------------------------------------------------------------#
from django.views.generic.edit import UpdateView
from django.contrib.auth.models import User
from .forms import EditarUsuarioForm

class EditarUsuarioView(UpdateView):
    model = User
    form_class = EditarUsuarioForm
    template_name = 'users/editar_usuario.html'
    success_url = '/'  # Redirigir tras guardar

    def get_object(self, queryset=None):
        # Aquí obtenemos el usuario que vamos a editar
        return User.objects.get(pk=self.kwargs['pk'])

