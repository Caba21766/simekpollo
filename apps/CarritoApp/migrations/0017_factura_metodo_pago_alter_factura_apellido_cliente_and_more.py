# Generated by Django 5.1.1 on 2024-11-25 01:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0016_factura'),
    ]

    operations = [
        migrations.AddField(
            model_name='factura',
            name='metodo_pago',
            field=models.CharField(default='No especificado', max_length=50),
        ),
        migrations.AlterField(
            model_name='factura',
            name='apellido_cliente',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='factura',
            name='nombre_cliente',
            field=models.CharField(max_length=100),
        ),
    ]
