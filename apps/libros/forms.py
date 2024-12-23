# forms.py
from django import forms
from .models import Categoria, Libro

class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['nombre']

class LibroForm(forms.ModelForm):
    class Meta:
        model = Libro
        fields = ['titulo', 'autor', 'categoria', 'descripcion', 'imagen']
