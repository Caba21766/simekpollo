from django.shortcuts import render, HttpResponse, redirect

# Importa la clase Carrito y el modelo Producto
from apps.CarritoApp.Carrito import Carrito
#from apps.CarritoApp.models import Producto
from apps.libros.models import Libro  # Esto está bien si lo necesitas
from .models import Factura, Producto, generar_numero_factura  


#---------------------Producto y Modificaciones-------------------#
#---------------------------------------------------------------#

def agregar_o_modificar_producto(request, pk=None):

    if pk:
        producto = get_object_or_404(Producto, pk=pk)
    else:
        producto = None


    # Verifica si el usuario está autenticado
    if not request.user.is_authenticated:
        messages.error(request, "Debes iniciar sesión o registrarte para agregar productos al carrito.")
        return redirect('iniciar_sesion')  # Redirige a la página de inicio de sesión
    
    # Si está autenticado, continúa con la lógica para agregar el producto
    carrito = request.session.get('carrito', {})
    if request.method == "POST":
        form = ProductoForm(request.POST, request.FILES, instance=producto)
        if form.is_valid():
            form.save()
            return redirect('CarritoApp:agregar_producto')
    else:
        form = ProductoForm(instance=producto)

    categoria_id = request.GET.get('categoria', None)
    if categoria_id:
        productos = Producto.objects.filter(categoria_id=categoria_id)
    else:
        productos = Producto.objects.all()

    categorias = Categ_producto.objects.all()

    return render(request, 'agregar_producto.html', {
        'form': form,
        'productos': productos,
        'categorias': categorias,
    })


#-------------Eliminar Producto-------------------------------------------#

from django.shortcuts import get_object_or_404, redirect
from .models import Producto

def eliminar_producto(request, pk):
    producto = get_object_or_404(Producto, pk=pk)
    producto.delete()  # Elimina el producto
    return redirect('CarritoApp:agregar_producto')  # Redirige a la vista de agregar productos


#-----------Agregar Compra------------------------------------------#
# -----apps/CarritoApp/views.py -- Compra-tcuts import from django.shortcuts import render

from django.shortcuts import render, get_object_or_404
from .models import Compra
from .forms import CompraForm, FacturaImagenForm, ProductoForm

def agregar_compra(request):
    compras = Compra.objects.all()
    compras = compras.order_by('-fecha_compra')  # Ordena por fecha de compra de más reciente a más antiguo

    if request.method == 'POST':
        form = CompraForm(request.POST, request.FILES)
        if form.is_valid():
            compra = form.save()  # Aquí se actualizará el stock automáticamente
            form = CompraForm()  # Resetear el formulario después de guardar
            return render(request, 'agregar_compra.html', {'form': form, 'compras': compras, 'success': True})
    else:
        form = CompraForm()

    # Filtrado de compras
    producto = request.GET.get('producto')
    fecha_compra = request.GET.get('fecha_compra')
    factura = request.GET.get('factura')
    proveedor = request.GET.get('proveedor')

    if producto:
        compras = compras.filter(producto__nombre_producto__icontains=producto)
    if fecha_compra:
        compras = compras.filter(fecha_compra=fecha_compra)
    if factura:
        compras = compras.filter(factura_compra__icontains=factura)
    if proveedor:
        compras = compras.filter(provedor__nombre__icontains=proveedor)


    # Cálculos para totales
    total_cantidad = sum(compra.cantidad for compra in compras)
    total_precio = sum(compra.cantidad * compra.precio_compra for compra in compras)

    return render(request, 'agregar_compra.html', {
        'form': form,
        'compras': compras,
        'total_cantidad': total_cantidad,
        'total_precio': total_precio,
    })

#-----------Modificar Compra----------------------------------------#
def modificar_compra(request, pk):
    compra = get_object_or_404(Compra, pk=pk)
    print("Compra seleccionada:", compra)  # Depuración
    if request.method == 'POST':
        form = CompraForm(request.POST, instance=compra)
        if form.is_valid():
            form.save()
            return redirect('CarritoApp:agregar_compra')
    else:
        form = CompraForm(instance=compra)
    print("Formulario cargado:", form)  # Depuración
    return render(request, 'CarritoApp/modificar_compra.html', {'form': form})



#-----------Eliminar Compra----------------------------------------#
from django.shortcuts import get_object_or_404, redirect
from .models import Compra, Producto

def eliminar_compra(request, pk):
    compra = get_object_or_404(Compra, pk=pk)
    
    if request.method == 'POST':
        # Obtener el producto relacionado
        producto = compra.producto  # Asumiendo que hay un ForeignKey a Producto en el modelo Compra
        
        # Actualizar el stock del producto
        if producto:
            producto.stock -= compra.cantidad  # Sumar la cantidad de la compra al stock
            producto.save()
        
        # Eliminar la compra
        compra.delete()
        
        # Redirigir a la vista de agregar compras
        return redirect('CarritoApp:agregar_compra')
    
    # Renderizar una confirmación de eliminación (opcional)
    return render(request, 'confirmar_eliminar.html', {'compra': compra})


# ---------- listado_comprAS  LISTADO DE COMPRAS..................
from django.shortcuts import render
from .models import Compra
from decimal import Decimal

def listado_compra(request):
    compras = Compra.objects.all()

    # Filtros
    fecha = request.GET.get('fecha')
    factura = request.GET.get('factura')
    provedor = request.GET.get('provedor')
    producto = request.GET.get('producto')

    if fecha:
        compras = compras.filter(fecha_compra=fecha)
    if factura:
        compras = compras.filter(factura_compra__icontains=factura)
    if provedor:
        compras = compras.filter(provedor__nombre__icontains=provedor)
    if producto:
        compras = compras.filter(producto__nombre_producto__icontains=producto)

    # Depuración
    for compra in compras:
        print(f"Producto: {compra.producto}, Cantidad: {compra.cantidad}, Precio Compra: {compra.precio_compra}")

    # Cálculos para los totales
    total_cantidad = sum(compra.cantidad for compra in compras if compra.cantidad)
    total_precio = sum(compra.precio_compra for compra in compras if compra.precio_compra)

    print(f"Total Cantidad Calculado: {total_cantidad}")
    print(f"Total Precio Calculado (solo suma de precios): {total_precio}")

    return render(request, 'listado_compra.html', {
        'compras': compras,
        'total_cantidad': total_cantidad,
        'total_precio': total_precio,
    })


#------------------Agregar_categorias-------------------------------
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .forms import CategoriaForm
from .models import Categ_producto

def agregar_categoria(request):
    categorias = Categ_producto.objects.all()

    # Manejo de eliminación
    if 'delete_id' in request.GET:
        delete_id = request.GET.get('delete_id')
        categoria = get_object_or_404(Categ_producto, id=delete_id)
        categoria.delete()
        messages.success(request, "Categoría eliminada exitosamente.")
        return redirect('CarritoApp:agregar_categoria')

    # Manejo de modificación
    if 'edit_id' in request.GET:
        edit_id = request.GET.get('edit_id')
        categoria = get_object_or_404(Categ_producto, id=edit_id)
        form = CategoriaForm(request.POST or None, instance=categoria)
        if form.is_valid():
            form.save()
            messages.success(request, "Categoría modificada exitosamente.")
            return redirect('CarritoApp:agregar_categoria')
    else:
        # Formulario para agregar nuevas categorías
        form = CategoriaForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request, "Categoría agregada exitosamente.")
            return redirect('CarritoApp:agregar_categoria')

    return render(request, 'agregar_categoria.html', {
        'form': form,
        'categorias': categorias,
    })

#-------------------------------------#
#-----Agregar_provedores----------------------------

from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .forms import ProvedorForm
from .models import Provedor

def agregar_provedor(request):
    provedores = Provedor.objects.all()

    # Manejo de eliminación
    if 'delete_id' in request.GET:
        delete_id = request.GET.get('delete_id')
        provedor = get_object_or_404(Provedor, id=delete_id)
        provedor.delete()
        messages.success(request, "Proveedor eliminado exitosamente.")
        return redirect('CarritoApp:agregar_provedor')

    # Manejo de modificación
    if 'edit_id' in request.GET:
        edit_id = request.GET.get('edit_id')
        provedor = get_object_or_404(Provedor, id=edit_id)
        form = ProvedorForm(request.POST or None, instance=provedor)
        if form.is_valid():
            form.save()
            messages.success(request, "Proveedor modificado exitosamente.")
            return redirect('CarritoApp:agregar_provedor')
    else:
        # Formulario para agregar nuevos proveedores
        form = ProvedorForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request, "Proveedor agregado exitosamente.")
            return redirect('CarritoApp:agregar_provedor')

    return render(request, 'agregar_provedor.html', {
        'form': form,
        'provedores': provedores,
    })


#-----------------------------REALIZAR VENTAS -----------------------#
from django.shortcuts import render, redirect
from .forms import VentaForm
from .models import Venta, Producto
import logging

logger = logging.getLogger(__name__)

def realizar_venta(request):
    mensaje = None
    if request.method == 'POST':
        form = VentaForm(request.POST)
        if form.is_valid():
            venta = form.save(commit=False)  # No guarda aún en la BD
            producto = venta.producto  # Obtiene el producto asociado
            
            # Validación de stock
            if venta.cantidad > producto.stock:
                mensaje = "Stock insuficiente. No se pudo realizar la venta."
            else:
                # Registra el stock antes y después de la operación
                logger.info(f"Stock antes: {producto.stock} - Cantidad vendida: {venta.cantidad}")
                producto.stock -= venta.cantidad
                producto.save()  # Guarda el producto con el stock actualizado
                logger.info(f"Stock después: {producto.stock}")
                
                venta.usuario = request.user  # Asigna el usuario actual
                venta.save()  # Guarda la venta
                mensaje = "Venta registrada con éxito."
                form = VentaForm()  # Reinicia el formulario
        else:
            mensaje = "Por favor completa todos los campos correctamente."
    else:
        form = VentaForm()

    ventas = Venta.objects.all()  # Obtén todas las ventas para mostrar
    return render(request, 'realizar_venta.html', {
        'form': form,
        'ventas': ventas,
        'mensaje': mensaje
    })

#--------------------Listado de Ventas-----------------------

from django.shortcuts import render
from .models import Venta

def listar_ventas(request):
    ventas = Venta.objects.all()
    return render(request, 'listar_ventas.html', {'ventas': ventas})



#----------------- ----Calcular Total  Carrito----------------- -- 
from django.shortcuts import render, get_object_or_404, redirect
from .models import Producto

def calcular_total_carrito(carrito):
    total = 0
    for item in carrito.values():
        total += item['cantidad'] * item['precio']
    return total

#---------------------RESTAR del Carrito-------------/views.py --

from django.shortcuts import get_object_or_404, redirect
from .models import Producto

def restar_del_carrito(request, producto_id):
    carrito = request.session.get('carrito', {})  # Obtén el carrito de la sesión

    if str(producto_id) in carrito:
        if carrito[str(producto_id)]['cantidad'] > 1:
            # Resta una unidad del producto en el carrito
            carrito[str(producto_id)]['cantidad'] -= 1
            carrito[str(producto_id)]['acumulado'] -= float(carrito[str(producto_id)]['precio'])
        else:
            # Si la cantidad es 1, elimina el producto del carrito
            del carrito[str(producto_id)]
    
    request.session['carrito'] = carrito  # Actualiza el carrito en la sesión
    return redirect('CarritoApp:ver_carrito')


#---------------------Sumar del Carrito-------------/views.py --
def sumar_producto(request, producto_id):
    carrito = request.session.get('carrito', {})  # Obtén el carrito de la sesión

    if str(producto_id) in carrito:
        carrito[str(producto_id)]['cantidad'] += 1
        carrito[str(producto_id)]['acumulado'] += float(carrito[str(producto_id)]['precio'])

    request.session['carrito'] = carrito  # Actualiza el carrito en la sesión
    return redirect('CarritoApp:ver_carrito')  # Redirigir a la plantilla carrito



#---------------Limpiar Carrito----------------------------- --

def limpiar_carrito(request):
    request.session['carrito'] = {}
    return redirect('CarritoApp:ver_carrito')



#----------------- ----TIENDA-------------/views.py --
from datetime import datetime
from .models import Factura, Producto, Categ_producto
from django.shortcuts import render
from django.core.paginator import Paginator

def tienda(request):
    # Verificar si el usuario está autenticado
    if request.user.is_authenticated:
        usuario = request.user
        nombre_usuario = usuario.first_name
        apellido_usuario = usuario.last_name
    else:
        nombre_usuario = "Desconocido"
        apellido_usuario = "Usuario"

    # Obtener el último número de factura
    ultima_factura = Factura.objects.last()
    if ultima_factura:
        numero_factura = int(ultima_factura.numero_factura) + 1
        numero_factura = str(numero_factura).zfill(5)
    else:
        numero_factura = "00001"

    # Filtro por categoría
    categoria_id = request.GET.get('categoria')  # Obtiene el ID de la categoría desde el parámetro GET
    if categoria_id:
        productos = Producto.objects.filter(categoria_id=categoria_id)  # Filtra productos por categoría seleccionada
    else:
        productos = Producto.objects.all()  # Muestra todos los productos si no se selecciona categoría

    # Paginación
    paginator = Paginator(productos, 3)  # Muestra 3 productos por página
    page_number = request.GET.get('page')  # Obtiene el número de página desde el parámetro GET
    productos_pagina = paginator.get_page(page_number)  # Obtiene los productos de la página actual

    # Obtener todas las categorías para mostrar en el filtro
    categorias = Categ_producto.objects.all()

    # Verificar si se agregó un producto al carrito
    producto_en_carrito = False
    if request.GET.get('producto_id'):
        producto_en_carrito = True

    # Otros datos
    fecha_actual = datetime.now().strftime('%Y-%m-%d')
    carrito = request.session.get('carrito', {})
    total_carrito = calcular_total_carrito(carrito)

    # Contexto para renderizar
    context = {
        'productos_pagina': productos_pagina,  # Productos paginados
        'categorias': categorias,  # Todas las categorías
        'carrito': carrito,  # Carrito de compras
        'total_carrito': total_carrito,  # Total del carrito
        'numero_factura': numero_factura,  # Número de la factura
        'fecha': fecha_actual,  # Fecha actual
        'nombre': nombre_usuario,  # Nombre del usuario
        'apellido': apellido_usuario,  # Apellido del usuario
        'categoria_seleccionada': categoria_id,  # Categoría seleccionada
        'producto_en_carrito': producto_en_carrito,  # Variable para mostrar el modal
    }

    return render(request, 'tienda.html', context)



#---------------------AGREGAR AL CARRITO-------------/views.py --
from django.shortcuts import get_object_or_404, redirect
from django.contrib import messages
from .models import Producto

def agregar_al_carrito(request, producto_id):

    # Verifica si el usuario está autenticado
    if not request.user.is_authenticated:
        messages.error(request, "Debes iniciar sesión o registrarte para agregar productos al carrito.")
        return redirect('tienda')  # En lugar de redirigir a iniciar sesión, lo redirige a la tienda
    
    # Si está autenticado, agrega el producto al carrito
    producto = get_object_or_404(Producto, id=producto_id)
    carrito = request.session.get('carrito', {})


    if str(producto_id) not in carrito:
        carrito[str(producto_id)] = {
            'producto_id': producto_id,  # Incluye el ID del producto aquí
            'nombre': producto.nombre_producto,  # Ajusta según tu modelo
            'precio': float(producto.precio),
            'cantidad': 1,
            'acumulado': float(producto.precio),
        }
    else:
        carrito[str(producto_id)]['cantidad'] += 1
        carrito[str(producto_id)]['acumulado'] += float(producto.precio)

    request.session['carrito'] = carrito
    return redirect('CarritoApp:tienda')  # Redirige a la tienda o donde prefieras


#----------------- CARRITO por falta de mercaderia ------------------------------------
from django.shortcuts import render

def carrito(request):
    carrito = request.session.get('carrito', {})
    return render(request, 'CarritoApp/carrito.html', {'carrito': carrito})




#---------------------Guardar factura--------------------------#
from datetime import date
from datetime import date
import json
from django.shortcuts import render, redirect
from .models import Producto, Factura

def guardar_factura(request):
    if request.method == 'POST':
        metodo_pago = request.POST.get('metodo_pago', 'No especificado')

        if request.user.is_authenticated:
            nombre_cliente = request.user.first_name
            apellido_cliente = request.user.last_name
        else:
            nombre_cliente = "Desconocido"
            apellido_cliente = "Usuario"

        ultima_factura = Factura.objects.last()
        if ultima_factura:
            numero_factura = int(ultima_factura.numero_factura) + 1
            numero_factura = str(numero_factura).zfill(5)
        else:
            numero_factura = "00001"

        carrito = request.session.get('carrito', {})
        total = 0
        detalle_productos = []
        errores_stock = []  # Lista para manejar errores de stock

        for key, value in carrito.items():
            try:
                producto = Producto.objects.get(id=value['producto_id'])
                cantidad = value['cantidad']
                precio_unitario = float(producto.precio)
                subtotal = precio_unitario * cantidad
                total += subtotal

                # Verificar stock disponible
                if producto.stock >= cantidad:
                    detalle_productos.append({
                        'nombre_producto': producto.nombre_producto,
                        'cantidad_vendida': cantidad,
                        'precio_unitario': precio_unitario,
                        'subtotal': subtotal,
                    })
                    producto.stock -= cantidad
                    producto.save()
                else:
                    # Añadir el error de stock
                    errores_stock.append({
                        'nombre_producto': producto.nombre_producto,
                        'stock_disponible': producto.stock,
                        'cantidad_solicitada': cantidad
                    })
            except Producto.DoesNotExist:
                continue

        # Si hay errores de stock, redirigir a la página de error
        if errores_stock:
            return render(request, 'CarritoApp/error_stock.html', {'errores_stock': errores_stock})

        fecha_actual = date.today()
        nueva_factura = Factura(
            numero_factura=numero_factura,
            fecha=fecha_actual,
            nombre_cliente=nombre_cliente,
            apellido_cliente=apellido_cliente,
            metodo_pago=metodo_pago,
            total=total,
            detalle_productos=json.dumps(detalle_productos)
        )
        nueva_factura.save()

        request.session['carrito'] = {}
        request.session.modified = True

        return redirect('CarritoApp:tienda')

    return redirect('CarritoApp:tienda')


#------------------- Confirmar Pago --------------------------

from django.shortcuts import redirect, get_object_or_404
from django.contrib import messages
from .models import Factura, Producto

def confirmar_pago(request):
    if request.method == 'POST':
        metodo_pago = request.POST.get('metodo_pago')
        carrito = request.session.get('carrito', {})

        if not carrito:
            messages.error(request, 'No hay productos en el carrito.')
            return redirect('CarritoApp:carrito')

        # Crear la nueva factura
        nueva_factura = Factura.objects.create(
            numero_factura=Factura.objects.count() + 1,
            fecha=datetime.now(),
            nombre_cliente=request.user.first_name,
            apellido_cliente=request.user.last_name,
            metodo_pago=metodo_pago,
            total=sum(item['acumulado'] for item in carrito.values())
        )

        # Recorrer los productos en el carrito
        for item_id, item_data in carrito.items():
            producto = get_object_or_404(Producto, id=item_data['producto_id'])

            # Guardar la cantidad vendida
            nueva_factura.productos.add(
                producto,
                through_defaults={'cantidad_vendida': item_data['cantidad']}
            )

            # Restar el stock del producto
            producto.stock -= item_data['cantidad']
            producto.save()

        # Limpiar el carrito
        del request.session['carrito']
        request.session.modified = True

        messages.success(request, 'Factura guardada exitosamente.')
        return redirect('CarritoApp:tienda')

    messages.error(request, 'Método no permitido.')
    return redirect('CarritoApp:carrito')


#-----------------------Listar factura------------------------------
from django.db.models import Sum

def lista_facturas(request):
    facturas = Factura.objects.all().order_by('-numero_factura')
    

    # Obtener parámetros de filtro
    fecha_desde = request.GET.get('fecha_desde', None)
    fecha_hasta = request.GET.get('fecha_hasta', None)
    apellido_cliente = request.GET.get('apellido_cliente', None)
    metodo_pago = request.GET.get('metodo_pago', None)

    # Filtrar por rango de fechas
    if fecha_desde:
        facturas = facturas.filter(fecha__gte=fecha_desde)
    if fecha_hasta:
        facturas = facturas.filter(fecha__lte=fecha_hasta)

    # Filtrar por apellido del cliente
    if apellido_cliente:
        facturas = facturas.filter(apellido_cliente__icontains=apellido_cliente)

    # Filtrar por método de pago
    if metodo_pago and metodo_pago != "--Seleccionar--":
        facturas = facturas.filter(metodo_pago__iexact=metodo_pago)

    # Calcular el total acumulado
    total_acumulado = facturas.aggregate(Sum('total'))['total__sum'] or 0

    return render(request, 'lista_facturas.html', {
        'facturas': facturas,
        'fecha_desde': fecha_desde,
        'fecha_hasta': fecha_hasta,
        'apellido_cliente': apellido_cliente,
        'metodo_pago': metodo_pago,
        'total_acumulado': total_acumulado,  # Pasar el total acumulado al contexto
    })

#---------------------------DETALLE PRODUCTO------------------------------------#

from django.shortcuts import render, get_object_or_404
from .models import Factura
import json

def detalle_factura(request, factura_id):
    # Obtener la factura
    factura = get_object_or_404(Factura, id=factura_id)

    # Decodificar el JSON de detalle_productos
    try:
        detalle_productos = json.loads(factura.detalle_productos)
    except json.JSONDecodeError:
        detalle_productos = []

    # Renderizar la plantilla
    return render(request, 'detalle_factura.html', {
        'factura': factura,
        'detalle_productos': detalle_productos,
    })

#---------------------------GENERAR PDF FACTURA------------------------------------#

from reportlab.pdfgen import canvas
from django.http import HttpResponse
from .models import Factura

def generar_pdf_factura(request, factura_id):
    factura = Factura.objects.get(id=factura_id)

    # Crear una respuesta PDF
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'inline; filename="factura_{factura.numero_factura}.pdf"'

    # Crear el documento PDF
    pdf = canvas.Canvas(response)
    pdf.drawString(100, 800, f"Factura N°: {factura.numero_factura}")
    pdf.drawString(100, 780, f"Fecha: {factura.fecha}")
    pdf.drawString(100, 760, f"Cliente: {factura.nombre_cliente} {factura.apellido_cliente}")
    pdf.drawString(100, 740, f"Método de Pago: {factura.metodo_pago}")
    pdf.drawString(100, 720, f"Total: ${factura.total:.2f}")

    # Guardar y cerrar el PDF
    pdf.showPage()
    pdf.save()
    return response

#---------------------------FACTURAS USUARIO------------------------------------#

from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .models import Factura

@login_required
def facturas_usuario(request):
    # Obtener solo las facturas asociadas al usuario autenticado
    usuario = request.user
    facturas = Factura.objects.filter(
        nombre_cliente=usuario.first_name,
        apellido_cliente=usuario.last_name
    ).order_by('-numero_factura') 

    return render(request, 'facturas_usuario.html', {'facturas': facturas})


#-------------------subir una imagen factura---------------------------------------------#

from django.shortcuts import get_object_or_404, redirect, render
from django.core.files.base import ContentFile
import base64
from .models import Factura
from django import forms

# Formulario para cargar la imagen
class SubirImagenFacturaForm(forms.ModelForm):
    class Meta:
        model = Factura
        fields = ['imagen_factura']

def subir_imagen_factura(request, factura_id):
    factura = get_object_or_404(Factura, id=factura_id)
    if request.method == 'POST':
        # Procesar imagen capturada desde la cámara
        captured_image_data = request.POST.get('captured_image')
        if captured_image_data:
            # Decodificar imagen en base64
            format, imgstr = captured_image_data.split(';base64,')
            ext = format.split('/')[1]
            image_data = ContentFile(base64.b64decode(imgstr), name=f"factura_{factura.numero_factura}.{ext}")
            
            # Eliminar imagen anterior si existe
            if factura.imagen_factura:
                factura.imagen_factura.delete(save=False)
            
            factura.imagen_factura = image_data
            factura.save()
            return redirect('CarritoApp:lista_facturas')  # Redirigir después de guardar

        # Procesar imagen subida desde archivo
        form = SubirImagenFacturaForm(request.POST, request.FILES, instance=factura)
        if form.is_valid():
            # Eliminar imagen anterior si existe
            if factura.imagen_factura:
                factura.imagen_factura.delete(save=False)
            form.save()
            return redirect('CarritoApp:lista_facturas')  # Redirigir después de guardar
    else:
        form = SubirImagenFacturaForm(instance=factura)
    
    return render(request, 'subir_imagen_factura.html', {'form': form, 'factura': factura})


#----------------------------Eliminar Imagen Factura------------------------------------#
from django.shortcuts import redirect, get_object_or_404
from django.contrib import messages
from .models import Factura

def eliminar_imagen_factura(request, factura_id):
    factura = get_object_or_404(Factura, id=factura_id)
    if factura.imagen_factura:
        factura.imagen_factura.delete()  # Elimina el archivo físico
        factura.imagen_factura = None  # Limpia el campo en la base de datos
        factura.save()
        messages.success(request, f"La imagen de la factura {factura.numero_factura} ha sido eliminada.")
    else:
        messages.error(request, f"La factura {factura.numero_factura} no tiene una imagen asociada.")
    return redirect('CarritoApp:lista_facturas')  # Redirige a la lista de facturas


#---------------------------------levantar_imagen_usuario------------------------------------#

from django.core.files.base import ContentFile
from django.shortcuts import get_object_or_404, render, redirect
from .models import Factura
from .forms import FacturaImagenForm
import base64

def levantar_imagen_usuario(request, pk):
    factura = get_object_or_404(Factura, pk=pk)
    if request.method == 'POST':
        if 'captured_image' in request.POST:  # Si viene desde la cámara
            captured_image_data = request.POST['captured_image']
            if captured_image_data:
                # Procesar datos base64
                format, imgstr = captured_image_data.split(';base64,')
                ext = format.split('/')[-1]
                image_file = ContentFile(base64.b64decode(imgstr), name=f"factura_{factura.numero_factura}.{ext}")
                
                # Eliminar imagen anterior si existe
                if factura.imagen_factura:
                    factura.imagen_factura.delete(save=False)
                
                # Asignar nueva imagen y guardar
                factura.imagen_factura = image_file
                factura.save()
                return redirect('CarritoApp:facturas_usuario')

        else:  # Si viene desde el formulario de carga
            form = FacturaImagenForm(request.POST, request.FILES, instance=factura)
            if form.is_valid():
                form.save()
                return redirect('CarritoApp:facturas_usuario')
    else:
        form = FacturaImagenForm(instance=factura)
    return render(request, 'levantar_imagen_usuario.html', {'form': form, 'factura': factura})




#---------------------------------ACTUALIZAR PRECIO DE PRODUTO------------------------------#
from decimal import Decimal
from django.shortcuts import render, redirect
from .models import Producto, Categ_producto
from django.contrib import messages

def actualizar_precios(request):
    if request.method == "POST":
        categoria_id = request.POST.get("categoria")
        porcentaje = Decimal(request.POST.get("porcentaje"))  # Convertir a Decimal

        if categoria_id:
            # Actualizar precios de una categoría específica
            productos = Producto.objects.filter(categoria_id=categoria_id)
        else:
            # Actualizar precios de todos los productos
            productos = Producto.objects.all()

        # Aplicar el cambio de precio
        for producto in productos:
            nuevo_precio = producto.precio * (1 + porcentaje / Decimal(100))
            producto.precio = round(nuevo_precio, 2)  # Redondear a 2 decimales
            producto.save()

        messages.success(request, "Precios actualizados correctamente.")
        return redirect("CarritoApp:agregar_producto")

    return redirect("CarritoApp:agregar_producto")


#---------------------ver carrito-------------------#
from datetime import date
from django.shortcuts import render
from .models import Factura

def ver_carrito(request):

 # Verifica si el usuario está autenticado
    if not request.user.is_authenticated:
        messages.error(request, "Debes iniciar sesión o registrarte para agregar productos al carrito.")
        return redirect('tienda')  # En lugar de redirigir a iniciar sesión, lo redirige a la tienda
    carrito = request.session.get('carrito', {})
    total_carrito = 0  # Para almacenar el total del carrito

    # Calcular el importe de cada producto y el total acumulado
    for key, value in carrito.items():
        value['importe'] = value['precio'] * value['cantidad']  # Calcular el importe
        total_carrito += value['importe']  # Acumular el total

    # Obtener el número de factura (puedes ajustar según tu lógica)
    ultima_factura = Factura.objects.last()  # O la lógica que estés usando
    numero_factura = int(ultima_factura.numero_factura) + 1 if ultima_factura else "00001"

    # Obtener la fecha actual
    fecha_actual = date.today()

    # Obtener el nombre y apellido del usuario (si está autenticado)
    if request.user.is_authenticated:
        nombre_usuario = request.user.first_name
        apellido_usuario = request.user.last_name
        usuario_no_registrado = False  # El usuario está registrado
    else:
        nombre_usuario = "Desconocido"
        apellido_usuario = "Usuario"
        usuario_no_registrado = True  # El usuario no está registrado

    return render(request, 'carrito.html', {
        'carrito': carrito,
        'total_carrito': total_carrito,  # Total acumulado
        'numero_factura': numero_factura,  # Número de la factura
        'fecha': fecha_actual,  # Fecha actual
        'nombre_usuario': nombre_usuario,  # Nombre del usuario
        'apellido_usuario': apellido_usuario,  # Apellido del usuario
        'usuario_no_registrado': usuario_no_registrado,  # Indicador de si el usuario está registrado
    })

#---------------------- REPAGINAR-------------------------------------------

from django.core.paginator import Paginator

def vista_productos(request):
    productos = Producto.objects.all()  # Obtén los productos
    paginator = Paginator(productos, 6)  # 6 productos por página (3 columnas x 2 filas)
    page_number = request.GET.get('page')  # Obtiene el número de página de la solicitud
    page_obj = paginator.get_page(page_number)  # Obtén los productos de la página actual
    return render(request, 'tu_plantilla.html', {'page_obj': page_obj})

#---------------------- BALANCE TOTAL-------------------------------------------

from django.shortcuts import render
from django.db.models import Sum
from .models import Producto, Compra, Factura
import json  # Para manejar JSON
from django.shortcuts import render
from django.db.models import Sum
from .models import Producto, Compra, Factura
import json  # Para manejar JSON

from django.shortcuts import render
from django.db.models import Sum, Max
from .models import Producto, Compra, Factura
import json  # Para manejar JSON

def balance_total(request):
    # Obtener los parámetros de fecha
    fecha_desde = request.GET.get('fecha_desde')
    fecha_hasta = request.GET.get('fecha_hasta')

    # Filtrar productos por rango de fechas si ambos parámetros están presentes
    productos = Producto.objects.all()
    if fecha_desde and fecha_hasta:
        productos = productos.filter(fecha_creacion__range=[fecha_desde, fecha_hasta])

    # Crear diccionarios para cálculos
    cantidades_por_producto = Compra.objects.values('producto_id').annotate(total_comprado=Sum('cantidad'))
    cantidades_por_producto = {item['producto_id']: item['total_comprado'] for item in cantidades_por_producto}

    cantidades_vendidas_por_producto = {}
    facturas = Factura.objects.all()
    for factura in facturas:
        try:
            detalle_productos = json.loads(factura.detalle_productos)
            for detalle in detalle_productos:
                producto = Producto.objects.filter(nombre_producto=detalle.get('nombre_producto')).first()
                if producto:
                    cantidad_vendida = detalle.get('cantidad_vendida', 0)
                    producto_id = producto.id
                    cantidades_vendidas_por_producto[producto_id] = (
                        cantidades_vendidas_por_producto.get(producto_id, 0) + cantidad_vendida
                    )
        except json.JSONDecodeError:
            print(f"Error al decodificar JSON en la factura {factura.numero_factura}")

    # Obtener el precio_compra de la última compra de cada producto
    costos_por_producto = {}
    compras = Compra.objects.values('producto_id').annotate(ultima_fecha=Max('fecha_compra'))
    for compra in compras:
        ultima_compra = Compra.objects.filter(
            producto_id=compra['producto_id'], fecha_compra=compra['ultima_fecha']
        ).first()
        if ultima_compra:
            costos_por_producto[compra['producto_id']] = ultima_compra.precio_compra

    precios_venta_por_producto = {producto.id: producto.precio for producto in productos}

    ganancias_por_producto = {
        producto_id: precios_venta_por_producto.get(producto_id, 0) - costos_por_producto.get(producto_id, 0)
        for producto_id in precios_venta_por_producto
    }

    total_caja_por_producto = {
        producto_id: ganancias_por_producto.get(producto_id, 0) * cantidades_vendidas_por_producto.get(producto_id, 0)
        for producto_id in ganancias_por_producto
    }

    # Calcular el total general de la caja
    total_caja = sum(total_caja_por_producto.values())

    # Calcular el total del stock
    total_stock = productos.aggregate(total_stock=Sum('stock'))['total_stock'] or 0

    return render(request, 'CarritoApp/balance_total.html', {
        'productos': productos,
        'total_stock': total_stock,
        'fecha_desde': fecha_desde,
        'fecha_hasta': fecha_hasta,
        'cantidades_por_producto': cantidades_por_producto,
        'cantidades_vendidas_por_producto': cantidades_vendidas_por_producto,
        'costos_por_producto': costos_por_producto,
        'precios_venta_por_producto': precios_venta_por_producto,
        'ganancias_por_producto': ganancias_por_producto,
        'total_caja_por_producto': total_caja_por_producto,
        'total_caja': total_caja,  # Pasar el total general
    })




#-----------------------------------------------------#
from django.shortcuts import render
from django.db.models import Sum
from .models import Compra
from .models import Producto, Compra

def balance_ganancia(request):
    # Obtener todos los productos con su precio_compra desde la tabla Compra
    productos_con_precios = Compra.objects.values(
        'producto__nombre_producto'
    ).annotate(precio_compra=Sum('precio_compra'))

    return render(request, 'CarritoApp/balance_ganancia.html', {
        'productos_con_precios': productos_con_precios,
    })

#-------------------Modificar Stock------------------------------------#
from django.shortcuts import render, get_object_or_404, redirect
from .models import Producto

# Vista para modificar el stock de un producto específico
def modificar_stock(request, pk):
    producto = get_object_or_404(Producto, pk=pk)
    if request.method == 'POST':
        nuevo_stock = request.POST.get('stock')  # Obtener el valor del formulario
        if nuevo_stock and nuevo_stock.isdigit():
            producto.stock = int(nuevo_stock)  # Actualizar el stock
            producto.save()
            return redirect('CarritoApp:modificacion_stock')  # Redirigir después de guardar
        else:
            error = "El stock debe ser un número válido."
            return render(request, 'CarritoApp/modificar_stock.html', {'producto': producto, 'error': error})
    return render(request, 'CarritoApp/modificar_stock.html', {'producto': producto})

#--------------Moificacion Stock---------------------------------------#
from django.shortcuts import render
from .models import Producto

def modificacion_stock(request):
    productos = Producto.objects.all()
    return render(request, 'CarritoApp/modificacion_stock.html', {'productos': productos})


#--------------movimiento_cliente---------------------------------------#
def movimiento_cliente(request):
    facturas = Factura.objects.all()
    apellido_cliente = request.GET.get('apellido_cliente', '')
    fecha_desde = request.GET.get('fecha_desde', '')
    fecha_hasta = request.GET.get('fecha_hasta', '')

    if apellido_cliente:
        facturas = facturas.filter(apellido_cliente__icontains=apellido_cliente)

    if fecha_desde:
        facturas = facturas.filter(fecha__gte=fecha_desde)

    if fecha_hasta:
        facturas = facturas.filter(fecha__lte=fecha_hasta)

    return render(request, 'CarritoApp/movimiento_cliente.html', {'facturas': facturas})

#-------------------productos_vendidos------------------------------------#

from django.shortcuts import render
from .models import Factura
import json

def productos_vendidos(request):
    productos_vendidos = []
    total_cantidad_vendida = 0
    total_precio_unitario = 0
    total_precio = 0

    # Filtros
    nombre_producto = request.GET.get('nombre_producto', '')
    fecha_desde = request.GET.get('fecha_desde', None)
    fecha_hasta = request.GET.get('fecha_hasta', None)

    facturas = Factura.objects.all()

    # Aplicar filtros
    if fecha_desde:
        facturas = facturas.filter(fecha__gte=fecha_desde)
    if fecha_hasta:
        facturas = facturas.filter(fecha__lte=fecha_hasta)

    for factura in facturas:
        try:
            detalle_productos = json.loads(factura.detalle_productos)
            for detalle in detalle_productos:
                nombre = detalle.get('nombre_producto', '')
                cantidad_vendida = detalle.get('cantidad_vendida', 0)
                precio_unitario = detalle.get('precio_unitario', 0)

                if nombre_producto.lower() in nombre.lower():
                    total = cantidad_vendida * precio_unitario
                    total_cantidad_vendida += cantidad_vendida
                    total_precio_unitario += precio_unitario
                    total_precio += total

                    productos_vendidos.append({
                        'fecha': factura.fecha,
                        'nombre_producto': nombre,
                        'cantidad_vendida': cantidad_vendida,
                        'precio_unitario': precio_unitario,
                        'total': total,
                    })
        except json.JSONDecodeError:
            print(f"Error al decodificar JSON en la factura {factura.numero_factura}")

    return render(request, 'CarritoApp/productos_vendidos.html', {
        'productos_vendidos': productos_vendidos,
        'filtro_nombre_producto': nombre_producto,
        'fecha_desde': fecha_desde,
        'fecha_hasta': fecha_hasta,
        'total_cantidad_vendida': total_cantidad_vendida,
        'total_precio_unitario': total_precio_unitario,
        'total_precio': total_precio,
    })
