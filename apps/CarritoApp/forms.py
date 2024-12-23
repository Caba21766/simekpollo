from django import forms
from .models import Producto
from .models import Compra
from .models import Venta

from django import forms
from .models import Producto

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = ['nombre_producto', 'descripcion', 'imagen', 'categoria','stock', 'precio', 'imagen2', 'imagen3', 'imagen4', 'imagen5']
        
        widgets = {
        'stock': forms.TextInput(attrs={'readonly': 'readonly',
        'style': 'background-color: #add8e6; border: 1px solid #ccc; padding: 5px;',
        }),
        }

        imagen = forms.ImageField(required=False)
        imagen2 = forms.ImageField(required=False)
        imagen3 = forms.ImageField(required=False)
        imagen4 = forms.ImageField(required=False)
        imagen5 = forms.ImageField(required=False)
        
    def clean(self):
        cleaned_data = super().clean()
        descripcion = cleaned_data.get("descripcion")
        imagen = cleaned_data.get("imagen")
        categoria = cleaned_data.get("categoria")

        if not descripcion:
            self.add_error('descripcion', "La descripción no puede estar vacía.")
        if not imagen:
            self.add_error('imagen', "Debes subir una imagen del producto.")
        if not categoria:
            self.add_error('categoria', "Debes seleccionar una categoría.")


#---------------------------------------------------------------------------

from django import forms
from .models import Provedor

class ProvedorForm(forms.ModelForm):
    class Meta:
        model = Provedor
        fields = ['nombre', 'direccion', 'telefono', 'email']

#---------------------------------------------------------------------------#

from .models import Compra

class CompraForm(forms.ModelForm):
    class Meta:
        model = Compra
        fields = ['producto', 'cantidad', 'precio_compra', 'factura_compra', 'fecha_compra', 'provedor']  # Nota: sigue siendo provedor

#---------------------------------------------------------------------------

from django import forms
from .models import Categ_producto

class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categ_producto
        fields = ['nombre']  # Incluir los campos necesarios del modelo
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese nombre de la categoría'}),
        }


#---------------------------------------------------------------------------
from django import forms
from .models import Venta

class VentaForm(forms.ModelForm):
    class Meta:
        model = Venta
        fields = ['producto', 'cantidad', 'precio']

    def clean(self):
        cleaned_data = super().clean()
        producto = cleaned_data.get('producto')
        cantidad = cleaned_data.get('cantidad')
        precio = cleaned_data.get('precio')

        if not producto or not cantidad or not precio:
            raise forms.ValidationError("Todos los campos son obligatorios.")
        return cleaned_data

#---------------------------------------------------------------------------

from django import forms
from .models import Factura

class FacturaImagenForm(forms.ModelForm):
    class Meta:
        model = Factura
        fields = ['imagen_factura']  # Asegúrate de que el modelo Factura tiene este campo
