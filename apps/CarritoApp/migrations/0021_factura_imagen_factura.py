# Generated by Django 5.1.3 on 2024-11-28 21:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CarritoApp', '0020_alter_factura_fecha'),
    ]

    operations = [
        migrations.AddField(
            model_name='factura',
            name='imagen_factura',
            field=models.ImageField(blank=True, null=True, upload_to='factura_images/'),
        ),
    ]