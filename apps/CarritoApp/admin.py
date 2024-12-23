from django.contrib import admin
from .models import Factura, Producto, Compra, Provedor, Venta, Categ_producto

# Registro de modelos con admin.site.register
admin.site.register(Compra)
admin.site.register(Venta)
admin.site.register(Provedor)
admin.site.register(Factura)

# Registro de modelos con decoradores
@admin.register(Categ_producto)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('id', 'nombre')  # Combina las opciones que necesites
    # Puedes agregar más configuraciones aquí

@admin.register(Producto)
class ProductoAdmin(admin.ModelAdmin):
    list_display = ('id', 'nombre_producto', 'categoria', 'precio', 'stock')
