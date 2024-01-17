from django import forms
from django.db import models
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class Predict(forms.Form):
    name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))

    def __str__(self):
        return self.name
    

# change form
class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name', 'password1', 'password2']

class Category(models.Model):
    sub_category = models.ForeignKey('self', on_delete=models.CASCADE, related_name='sub_categories',null=True,blank=True)
    is_sub = models.BooleanField(default=False)
    name = models.CharField(max_length=200, null=True)
    slug = models.SlugField(max_length= 200, unique=True)
    
    def __str__(self):
        return self.name
    
class Product(models.Model):
    category = models.ManyToManyField(Category, related_name='product')
    name = models.CharField(max_length=200, null=True)
    price = models.FloatField()
    body = models.BooleanField(default=False, null=True, blank=False)
    image = models.ImageField(null=True,blank=True)
    detail = models.TextField(null=True,blank=True)
    
    def __str__(self):
        return self.name
    
    @property #Điều chỉnh thuộc tính
    def ImageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url

class ProductForm(forms.ModelForm):
    new_category = forms.CharField(required=False, label='New Category (necessary)', widget=forms.TextInput(attrs={'class': 'form-control'}))
    category = forms.ModelChoiceField(
        queryset=Category.objects.all(),
        required=False,
        widget=forms.Select(attrs={'class': 'custom-category-select'})
    )
    category_slug = forms.CharField(required=False, label='Category slug (necessary)', widget=forms.TextInput(attrs={'class': 'form-control'}))

    class Meta:
        model = Product
        fields = ['category', 'category_slug', 'new_category', 'name', 'price', 'image', 'detail']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
        
class Order(models.Model):
    customer = models.ForeignKey(User,on_delete=models.SET_NULL,blank=True,null=True)
    date_order = models.DateTimeField(auto_now_add=True)
    complete = models.BooleanField(default=False, null=True,blank=False)
    transaction_id = models.CharField(max_length=200,null=True)
    
    def __str__(self):
        return str(self.id)
    
    @property
    def get_cart_items(self):
        orderitems = self.orderitem_set.all()
        total = sum([item.quantity for item in orderitems])
        return total
    def get_cart_total(self):
        orderitems = self.orderitem_set.all()
        total = sum([item.get_total for item in orderitems])
        return total
        
class OrderItem(models.Model):
    product = models.ForeignKey(Product,on_delete=models.SET_NULL,blank=True,null=True)
    order = models.ForeignKey(Order,on_delete=models.SET_NULL,blank=True,null=True)
    quantity = models.IntegerField(default=0, blank=True,null=True)
    date_added = models.DateTimeField(auto_now_add=True)
    
    @property
    def get_total(self):
        total = self.product.price * self.quantity
        return total 

class ShippingAddress(models.Model):
    customer = models.ForeignKey(User,on_delete=models.SET_NULL,blank=True,null=True)
    order = models.ForeignKey(Order,on_delete=models.SET_NULL,blank=True,null=True)
    fullname = models.CharField(max_length=200,null=True)
    address = models.CharField(max_length=200,null=True)
    city = models.CharField(max_length=200,null=True)
    state = models.CharField(max_length=200,null=True)
    mobile = models.CharField(max_length=11,null=True)
    date_added = models.DateTimeField(auto_now_add=True)
 
    def __str__(self):
        return self.address
    
class ShippingAddressForm(forms.ModelForm):
    class Meta:
        model = ShippingAddress
        fields = ['fullname', 'address', 'city', 'state', 'mobile']
        
        
class Invoice(models.Model):
    customer = models.ForeignKey(User, on_delete=models.CASCADE)
    order_date = models.DateTimeField(auto_now_add=True)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    products = models.ManyToManyField(Product, through='InvoiceItem')

class InvoiceItem(models.Model):
    invoice = models.ForeignKey(Invoice, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=0)