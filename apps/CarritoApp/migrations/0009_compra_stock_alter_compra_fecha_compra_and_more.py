# Generated by Django 5.1.1 on 2024-11-21 20:05

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0008_remove_producto_titulo_producto_nombre_producto'),
    ]

    operations = [
        migrations.AddField(
            model_name='compra',
            name='stock',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='compra',
            name='fecha_compra',
            field=models.DateField(default=datetime.date.today),
        ),
        migrations.AlterField(
            model_name='producto',
            name='descripcion',
            field=models.TextField(default='Sin descripción'),
        ),
        migrations.AlterField(
            model_name='producto',
            name='imagen',
            field=models.ImageField(default='productos/default.jpg', upload_to='productos/'),
        ),
        migrations.AlterField(
            model_name='producto',
            name='nombre_producto',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='venta',
            name='cantidad',
            field=models.PositiveIntegerField(),
        ),
        migrations.AlterField(
            model_name='venta',
            name='factura_venta',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]
