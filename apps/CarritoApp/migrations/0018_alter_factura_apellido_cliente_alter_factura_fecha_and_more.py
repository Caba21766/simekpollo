# Generated by Django 5.1.1 on 2024-11-25 19:39

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0017_factura_metodo_pago_alter_factura_apellido_cliente_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='factura',
            name='apellido_cliente',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='factura',
            name='fecha',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='factura',
            name='metodo_pago',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='factura',
            name='nombre_cliente',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='factura',
            name='numero_factura',
            field=models.CharField(max_length=10),
        ),
        migrations.AlterField(
            model_name='producto',
            name='categoria',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='CarritoApp.categ_producto'),
        ),
        migrations.AlterField(
            model_name='producto',
            name='nombre_producto',
            field=models.CharField(default='Nombre del producto', max_length=255),
        ),
        migrations.CreateModel(
            name='FacturaProducto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.PositiveIntegerField()),
                ('subtotal', models.DecimalField(decimal_places=2, max_digits=10)),
                ('factura', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CarritoApp.factura')),
                ('producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CarritoApp.producto')),
            ],
        ),
        migrations.AddField(
            model_name='factura',
            name='productos',
            field=models.ManyToManyField(related_name='facturas', through='CarritoApp.FacturaProducto', to='CarritoApp.producto'),
        ),
    ]
