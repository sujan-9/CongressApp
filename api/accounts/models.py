from django.contrib.auth.models import AbstractUser
from django.db import models


class CustomUser(AbstractUser):
    """Custom User Model"""
    phone_number = models.EmailField(unique=True)
    otp = models.CharField(max_length=6, null=True, blank=True)

    def __str__(self):
        """String Representation of the model"""
        return self.username
