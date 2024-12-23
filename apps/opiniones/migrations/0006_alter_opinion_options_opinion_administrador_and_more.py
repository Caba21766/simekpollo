# Generated by Django 5.1.3 on 2024-12-22 13:29

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0023_producto_imagen2_producto_imagen3_producto_imagen4_and_more'),
        ('opiniones', '0005_alter_opinion_producto_alter_opinion_usuario_and_more'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='opinion',
            options={'verbose_name': 'Opinión', 'verbose_name_plural': 'Opiniones'},
        ),
        migrations.AddField(
            model_name='opinion',
            name='administrador',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='respuestas_administrador', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='opinion',
            name='producto',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='opiniones_producto', to='CarritoApp.producto'),
        ),
        migrations.AlterField(
            model_name='opinion',
            name='usuario',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='opiniones', to=settings.AUTH_USER_MODEL),
        ),
    ]