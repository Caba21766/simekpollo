from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    imagen = models.ImageField(upload_to='profile_pics/', null=True, blank=True)

    def __str__(self):
        return self.user.username

# Señal para crear un perfil automáticamente al crear un usuario
@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

# Señal para guardar el perfil al guardar el usuario
@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


#----------------Agregar campos adicionales al modelo User-----------------------------------------------------------------#

from django.contrib.auth.models import User
from django.db import models

# Agregar campos adicionales al modelo User
User.add_to_class('dni_usuario', models.CharField(max_length=20, blank=True, null=True, verbose_name="DNI"))
User.add_to_class('domicilio_usuario', models.CharField(max_length=255, blank=True, null=True, verbose_name="Domicilio"))
User.add_to_class('tel1_usuario', models.CharField(max_length=15, blank=True, null=True, verbose_name="Teléfono 1"))
User.add_to_class('tel2_usuario', models.CharField(max_length=15, blank=True, null=True, verbose_name="Teléfono 2"))
User.add_to_class('imagen_usuario', models.ImageField(upload_to='usuarios/', blank=True, null=True, verbose_name="Imagen"))