# Generated by Django 5.1.3 on 2024-12-04 19:49

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('opiniones', '0003_alter_opinion_producto_alter_opinion_usuario'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Producto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
                ('descripcion', models.TextField()),
                ('precio', models.DecimalField(decimal_places=2, max_digits=10)),
                ('stock', models.IntegerField()),
            ],
        ),
        migrations.AlterField(
            model_name='opinion',
            name='usuario',
            field=models.ForeignKey(db_column='usuario_id', on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterModelTable(
            name='opinion',
            table='opiniones_opinion',
        ),
        migrations.AlterField(
            model_name='opinion',
            name='producto',
            field=models.ForeignKey(db_column='producto_id', on_delete=django.db.models.deletion.CASCADE, to='opiniones.producto'),
        ),
    ]
