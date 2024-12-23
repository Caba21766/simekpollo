from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms

class RegistrarseForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=True, label="Nombre")
    last_name = forms.CharField(max_length=30, required=True, label="Apellido")
    email = forms.EmailField(required=True, label="Correo Electrónico")
    dni_usuario = forms.CharField(max_length=20, required=True, label="DNI")
    domicilio_usuario = forms.CharField(max_length=255, required=True, label="Domicilio")
    tel1_usuario = forms.CharField(max_length=15, required=True, label="Teléfono 1")
    tel2_usuario = forms.CharField(max_length=15, required=False, label="Teléfono 2")
    imagen_usuario = forms.ImageField(required=False, label="Imagen de perfil")

    class Meta:
        model = User
        fields = [
            'username',
            'first_name',
            'last_name',
            'email',
            'dni_usuario',
            'domicilio_usuario',
            'tel1_usuario',
            'tel2_usuario',
            'imagen_usuario',
            'password1',
            'password2',
        ]


#---------------------------------------------------------------------------#
from django import forms
from django.contrib.auth.models import User

class EditarUsuarioForm(forms.ModelForm):
    # Agregamos los campos adicionales de la tabla auth_user
    dni_usuario = forms.CharField(
        required=False, max_length=20, label="DNI",
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    domicilio_usuario = forms.CharField(
        required=False, max_length=255, label="Domicilio",
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    tel1_usuario = forms.CharField(
        required=False, max_length=15, label="Teléfono 1",
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    tel2_usuario = forms.CharField(
        required=False, max_length=15, label="Teléfono 2",
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    imagen_usuario = forms.ImageField(
        required=False, label="Imagen de perfil",
        widget=forms.FileInput(attrs={'class': 'form-control'})
    )

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email']  # Campos principales

    def __init__(self, *args, **kwargs):
        user_instance = kwargs.get('instance', None)
        super().__init__(*args, **kwargs)
        if user_instance:
            # Inicializamos los campos adicionales con los valores existentes en la tabla auth_user
            self.fields['dni_usuario'].initial = getattr(user_instance, 'dni_usuario', '')
            self.fields['domicilio_usuario'].initial = getattr(user_instance, 'domicilio_usuario', '')
            self.fields['tel1_usuario'].initial = getattr(user_instance, 'tel1_usuario', '')
            self.fields['tel2_usuario'].initial = getattr(user_instance, 'tel2_usuario', '')
            self.fields['imagen_usuario'].initial = getattr(user_instance, 'imagen_usuario', '')

    def save(self, commit=True):
        user = super().save(commit=False)
        # Guardamos los campos adicionales
        user.dni_usuario = self.cleaned_data.get('dni_usuario')
        user.domicilio_usuario = self.cleaned_data.get('domicilio_usuario')
        user.tel1_usuario = self.cleaned_data.get('tel1_usuario')
        user.tel2_usuario = self.cleaned_data.get('tel2_usuario')
        if self.cleaned_data.get('imagen_usuario'):
            user.imagen_usuario = self.cleaned_data.get('imagen_usuario')
        if commit:
            user.save()
        return user
