# Generated by Django 5.1.1 on 2024-11-25 20:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0018_alter_factura_apellido_cliente_alter_factura_fecha_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='factura',
            name='productos',
        ),
        migrations.AddField(
            model_name='factura',
            name='detalle_productos',
            field=models.TextField(default='Sin detalles'),
        ),
    ]