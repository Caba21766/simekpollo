# Generated by Django 5.1.1 on 2024-11-20 19:14

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0006_alter_producto_categoria'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='producto',
            name='autor',
        ),
    ]
