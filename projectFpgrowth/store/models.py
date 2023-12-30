# Trong file models.py
from django.db import models
from django.db import connections

class Product(models.Model):
    id = models.AutoField(primary_key=True, default=1)
    name = models.CharField(max_length=255)
    originalPrice = models.DecimalField(max_digits=10, decimal_places=0)
    promotionPrice = models.DecimalField(max_digits=10, decimal_places=0)
    image = models.CharField(max_length=50)
    createdBy = models.IntegerField()
    createdDate = models.DateField()
    cateId = models.IntegerField()
    qty = models.IntegerField()
    des = models.CharField(max_length=1000)
    status = models.BooleanField()
    soldCount = models.IntegerField()
    class Meta: 
        db_table = "products" 


class User(models.Model):
    id = models.AutoField(primary_key=True)
    email = models.CharField(max_length=255)
    fullname = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    role_id = models.IntegerField()
    status = models.BooleanField()
    address = models.CharField(max_length=500)
    isConfirmed = models.BooleanField(default=False)

    class Meta:
        db_table = "users"