# Generated by Django 5.1.3 on 2024-12-01 20:30

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog_auth', '0003_blogauth'),
    ]

    operations = [
        migrations.DeleteModel(
            name='BlogAuth',
        ),
    ]