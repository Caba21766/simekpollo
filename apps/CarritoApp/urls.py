from django.urls import path
from . import views

# Importa las vistas correctas

app_name = 'CarritoApp'  # Especificar el espacio de nombres para las rutas

# Define las URLs de la app
urlpatterns = [
    #---------------------------------------------------------------------------------------------
    path('listado_compra/', views.listado_compra, name='listado_compra'), 
    path('agregar_categoria/', views.agregar_categoria, name='agregar_categoria'),

    path('agregar_producto/', views.agregar_o_modificar_producto, name='agregar_producto'),
    path('modificar_producto/<int:pk>/', views.agregar_o_modificar_producto, name='modificar_producto'),
    path('eliminar_producto/<int:pk>/', views.eliminar_producto, name='eliminar_producto'),

    path('agregar-provedor/', views.agregar_provedor, name='agregar_provedor'),

    path('agregar-compra/', views.agregar_compra, name='agregar_compra'),
    path('agregar_compra/', views.agregar_compra, name='agregar_compra'),
    path('modificar_compra/<int:pk>/', views.modificar_compra, name='modificar_compra'),
    path('eliminar_compra/<int:pk>/', views.eliminar_compra, name='eliminar_compra'),

    path('realizar_venta/', views.realizar_venta, name='realizar_venta'),
    path('listar_ventas/', views.listar_ventas, name='listar_ventas'),

    path('tienda/', views.tienda, name='tienda'),
    
    path('agregar/<int:producto_id>/', views.agregar_al_carrito, name='Add'),
    path('restar/<int:producto_id>/', views.restar_del_carrito, name='Sub'),
    path('limpiar/', views.limpiar_carrito, name='limpiar_carrito'),
    
    path('guardar_factura/', views.guardar_factura, name='guardar_factura'),
    path('listar_facturas/', views.lista_facturas, name='listar_facturas'),
    path('detalle_factura/<int:factura_id>/', views.detalle_factura, name='detalle_factura'),

    path('factura/<int:factura_id>/pdf/', views.generar_pdf_factura, name='generar_pdf_factura'),
    path('listar_facturas/', views.lista_facturas, name='listar_facturas'),
    path('mis_facturas/', views.facturas_usuario, name='mis_facturas'),  # Vista para usuario a
    path('subir_imagen_factura/<int:factura_id>/', views.subir_imagen_factura, name='subir_imagen_factura'),

    path('listar_facturas/', views.lista_facturas, name='lista_facturas'),
    path('eliminar_imagen_factura/<int:factura_id>/', views.eliminar_imagen_factura, name='eliminar_imagen_factura'),

    path('levantar_imagen_usuario/<int:pk>/', views.levantar_imagen_usuario, name='levantar_imagen_usuario'),

    path('mis_facturas/', views.facturas_usuario, name='facturas_usuario'),

    path('actualizar_precios/', views.actualizar_precios, name='actualizar_precios'),

    path('carrito/', views.ver_carrito, name='ver_carrito'),
    path('agregar-al-carrito/<int:producto_id>/', views.agregar_al_carrito, name='agregar_al_carrito'),

    #-------------------- todo sobre CARRITO LIMPIAR - MOSTRAR CARRITO
    path('carrito/', views.ver_carrito, name='ver_carrito'),  # Esta es la vista que muestra el carrito

    path('carrito/', views.carrito, name='carrito'),  # Esta es la vista por stock negativo


    path('limpiar/', views.limpiar_carrito, name='limpiar_carrito'),  # Limpiar carrito
    path('sumar/<int:producto_id>/', views.sumar_producto, name='sumar_producto'),
    
    path('', views.vista_productos, name='vista_productos'),
    path('modificar_compra/<int:pk>/', views.modificar_compra, name='modificar_compra'),
    
    path('balance-total/', views.balance_total, name='balance_total'),
    
    path('balance-ganancia/', views.balance_ganancia, name='balance_ganancia'),

    
    path('modificacion-stock/', views.modificacion_stock, name='modificacion_stock'),
    path('modificar-stock/<int:pk>/', views.modificar_stock, name='modificar_stock'),

    path('movimiento-cliente/', views.movimiento_cliente, name='movimiento_cliente'),
    
    path('productos-vendidos/', views.productos_vendidos, name='productos_vendidos'),


    path('carrito/', views.carrito, name='carrito'),

    
         
]
