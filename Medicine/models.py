from django.db import models

# Create your models here.

class Medicine(models.Model):

        medName = models.CharField(max_length=100)
        medValue = models.DecimalField(max_digits=10, decimal_places=2)
        medMaterial = models.CharField(max_length=100)
        medFor = models.CharField(max_length=100)
        img_url = models.CharField(max_length=100)
        medManufactureCompany = models.CharField(max_length=100)

        def __str__(self):
                return self.medName
