#--------------Categoria-------------------------------------------------#
from django.db import models
class Categ_producto(models.Model):  # Este es el modelo de categorías
    nombre = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.nombre
    
#---------------------------------------------------------------#
#-------------------Proveedor--------------------------------------------#
from django.db import models
class Provedor(models.Model):
    nombre = models.CharField(max_length=100)
    direccion = models.TextField(blank=True, null=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)  # Teléfono
    email = models.EmailField(blank=True, null=True)  # Correo electrónico

    def __str__(self):
        return self.nombre

#---------------------------------------------------------------#
#--------------Producto-------------------------------------------------#
from .models import Categ_producto

class Producto(models.Model):
    nombre_producto = models.CharField(max_length=255, default="Nombre del producto")
    descripcion = models.TextField(default="Sin descripción")
    imagen = models.ImageField(upload_to='productos/', blank=False, null=False)
    categoria = models.ForeignKey(Categ_producto, on_delete=models.CASCADE,
    related_name='productos', default=1  # Cambia '1' por el ID de tu categoría predeterminada
)
    stock = models.PositiveIntegerField(default=0)
    precio = models.DecimalField(max_digits=10, decimal_places=2, default=0.00, blank=False, null=False)

    # Imágenes adicionales
    imagen2 = models.ImageField(upload_to='productos/', null=True, blank=True)
    imagen3 = models.ImageField(upload_to='productos/', null=True, blank=True)
    imagen4 = models.ImageField(upload_to='productos/', null=True, blank=True)
    imagen5 = models.ImageField(upload_to='productos/', null=True, blank=True)

    def __str__(self):
        return self.nombre_producto

#---------------------------------------------------------------#
#----------------Compra----------------------------------------------#
class Compra(models.Model):
    producto = models.ForeignKey('Producto', on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField()
    precio_compra = models.DecimalField(max_digits=10, decimal_places=2)
    factura_compra = models.CharField(max_length=100)
    fecha_compra = models.DateField()
    provedor = models.ForeignKey('Provedor', on_delete=models.SET_NULL, null=True)

    def save(self, *args, **kwargs):
        # Obtén el producto relacionado
        producto = self.producto
        if self.pk is None:  # Si es una nueva compra
            producto.stock += self.cantidad  # Suma la cantidad al stock actual
        else:
            # Si se actualiza una compra existente, ajusta el stock
            compra_original = Compra.objects.get(pk=self.pk)
            diferencia = self.cantidad - compra_original.cantidad
            producto.stock += diferencia

        producto.save()  # Guarda los cambios en el producto
        super().save(*args, **kwargs)  # Guarda la compra

#---------------------------------------------------------------#
#-----------------Venta----------------------------------------------#
from django.db import models
from django.contrib.auth.models import User
class Venta(models.Model):
    producto = models.ForeignKey('Producto', on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, null=False, default=1)
    fecha = models.DateTimeField(auto_now_add=True)  # Cambiado a DateTimeField

#---------------------------------------------------------------#
from django.db import models

class Factura(models.Model):
    numero_factura = models.CharField(max_length=10)
    fecha = models.DateField()
    nombre_cliente = models.CharField(max_length=255)
    apellido_cliente = models.CharField(max_length=255)
    metodo_pago = models.CharField(max_length=50)
    total = models.DecimalField(max_digits=10, decimal_places=2)
    detalle_productos = models.TextField(default="Sin detalles")
    imagen_factura = models.ImageField(upload_to='factura_images/', null=True, blank=True)

    def __str__(self):
        return f"Factura {self.numero_factura} - {self.nombre_cliente} {self.apellido_cliente}"


#-------------esta parte del codigo no se si sirve---------------------#
class FacturaProducto(models.Model):
    factura = models.ForeignKey(Factura, on_delete=models.CASCADE)  # Relación con Factura
    producto = models.ForeignKey('Producto', on_delete=models.CASCADE)  # Relación con Producto
    cantidad = models.PositiveIntegerField()  # Cantidad vendida de este producto
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)  # Subtotal por producto

    def __str__(self):
        return f"{self.producto.nombre_producto} x {self.cantidad} en {self.factura.numero_factura}"

def generar_numero_factura():
        ultima_factura = Factura.objects.all().order_by('id').last()
        if ultima_factura:
            ultimo_numero = int(ultima_factura.numero_factura)
            nuevo_numero = f"{ultimo_numero + 1:05d}"
        else:
            nuevo_numero = "00001"
        return nuevo_numero

