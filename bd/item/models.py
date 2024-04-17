from django.db import models

# Create your models here.
class Categoty(models.Model):
    name = models.CharField(max_length=50)

class Item(models.Model):
     name = models.CharField(max_length=50)
     category = models.CharField(max_length=50)
