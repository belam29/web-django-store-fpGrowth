# Trong file models.py
from django.db import models
from django.db import connections

class Product(models.Model):
    id = models.AutoField(primary_key=True, default=1)
    name = models.CharField(max_length=255)
    originalPrice = models.DecimalField(max_digits=10, decimal_places=0)
    promotionPrice = models.DecimalField(max_digits=10, decimal_places=0)
    image = models.CharField(max_length=50)
    cateId = models.IntegerField()
    qty = models.IntegerField()
    des = models.CharField(max_length=1000)
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

# table order
class Transaction(models.Model):
    createdDate = models.DateField()
    receivedDate = models.DateField(null=True)
    status = models.CharField(max_length=20)
    phone = models.IntegerField()
    address = models.CharField(max_length=500)
    email = models.EmailField()
    city = models.CharField(max_length=100)
    note = models.CharField(max_length=1000)

    class Meta:
        managed = False
        db_table = 'order'
        
class OrderDetail(models.Model):
    orderId = models.ForeignKey('Transaction', on_delete=models.CASCADE)
    productId = models.ForeignKey('Product', on_delete=models.CASCADE)
    qty = models.IntegerField()
    productPrice = models.DecimalField(max_digits=10, decimal_places=0)
    productName = models.CharField(max_length=100)
    productImage = models.CharField(max_length=50)

    def __str__(self):
        return f"OrderDetail {self.id} - Order: {self.orderId}, Product: {self.productId}, Qty: {self.qty}"