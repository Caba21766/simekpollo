# Generated by Django 5.1.1 on 2024-09-18 01:16

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Modulo1",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=20, unique=True)),
                ("descripcion", models.TextField()),
                ("fecha_agregado", models.DateTimeField(auto_now_add=True)),
            ],
            options={
                "ordering": ("fecha_agregado",),
            },
        ),
    ]