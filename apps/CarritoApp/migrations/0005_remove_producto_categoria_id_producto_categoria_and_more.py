# Generated by Django 5.1.1 on 2024-11-19 21:10

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0004_categ_producto'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='producto',
            name='categoria_id',
        ),
        migrations.AddField(
            model_name='producto',
            name='categoria',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='productos', to='CarritoApp.categ_producto'),
        ),
        migrations.AlterField(
            model_name='compra',
            name='factura_compra',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='compra',
            name='producto',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='compras', to='CarritoApp.producto'),
        ),
    ]
