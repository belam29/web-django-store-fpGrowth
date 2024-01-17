from django.shortcuts import redirect, render
from .fp_growth.fp_growth import result_fpGrowth
from .models import *
from django.http import HttpResponse, JsonResponse
import json
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
# Create your views here.


# Login
def SignIn(request):
    if request.user.is_authenticated:
        return redirect('index')
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('index')
        else: messages.info(request, 'username or password chưa đúng')
                
    context = {}
    return render(request, 'Login/signIn.html', context)    

#register
def SignUp(request):
    form = CreateUserForm()
    
    if request.method == "POST":
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('signIn')
    context = {'form':form}
    return render(request, 'Login/signUp.html', context)

def logoutPage(request):
    logout(request)
    return redirect('index')
# Create your views here.
def category(request):
    categories = Category.objects.filter(is_sub=False)
    active_category = request.GET.get('category','')
    if active_category:
        category_instance = Category.objects.get(slug=active_category)
        products = Product.objects.filter(category__slug = active_category)
        
    if request.method == "POST":
        searched = request.POST["searched"]
        keys = Product.objects.filter(name__contains = searched)
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer =customer, complete=False)
        items = order.orderitem_set.all()
    else:
        items = []
        order = {'get_cart_items':0, 'get_cart_total':0}
        customer = ''
    context = {'categories':categories, 'products':products, 'active_category':active_category, 'category_instance':category_instance, 'customer': customer, 'order':order, 'items': items}
    
    return render(request, 'category.html', context)

def search(request):
    if request.method == "POST":
        searched = request.POST["searched"]
        keys = Product.objects.filter(name__contains = searched)
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer =customer, complete=False)
        item = order.orderitem_set.all()
    else:
        item = []
        order = {'get_cart_items':0, 'get_cart_total':0}
        customer = ''
    product = Product.objects.all()
    return render(request, 'search.html', {"searched": searched, "keys": keys,'products':product, 'items':item, 'order':order, 'customer': customer})

def base(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer =customer, complete=False)
        item = order.orderitem_set.all()
    else:
        item = []
        order = {'get_cart_items':0, 'get_cart_total':0}
        customer =''
    product = Product.objects.all()
    context = {'products':product, 'items':item, 'order':order}
    return render(request, 'app/base.html', context)
def index(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer =customer, complete=False)
        item = order.orderitem_set.all()
    else:
        item = []
        order = {'get_cart_items':0, 'get_cart_total':0}
        customer = ''
    products = Product.objects.all()
    context = {'products':products, 'items':item, 'order':order, 'customer': customer}
    return render(request, 'index.html', context)

def contact(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer =customer, complete=False)
        item = order.orderitem_set.all()
    else:
        item = []
        order = {'get_cart_items':0, 'get_cart_total':0}
        customer =''
    product = Product.objects.all()
    context = {'products':product, 'items':item, 'order':order, 'customer': customer}    
    return render(request, 'contact.html', context)

def cart(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer =customer, complete=False)
        item = order.orderitem_set.all()
    else:
        item = []
        order = {'get_cart_items':0, 'get_cart_total':0}
        customer = ''
    context = {'items':item, 'order':order,'customer': customer}
    return render(request, 'cart.html', context)
    
def listProduct(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer =customer, complete=False)
        item = order.orderitem_set.all()
    else:
        item = []
        order = {'get_cart_items':0, 'get_cart_total':0}
        customer = ''
    categories = Category.objects.filter(is_sub=False)
    active_category = request.GET.get('category','')    

    product = Product.objects.all()
    context = {'products':product, 'items':item, 'order':order, 'customer': customer, 'categories':categories, 'active_category':active_category}
    return render(request, 'listProduct.html', context)

def news(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer =customer, complete=False)
        item = order.orderitem_set.all()
    else:
        item = []
        order = {'get_cart_items':0, 'get_cart_total':0}
        customer = ''
    context = {'items':item, 'order':order, 'customer': customer}
    return render(request, 'news.html', context)


def calculate_total_amount(order):
    total_amount = sum(item.product.price * item.quantity for item in order.orderitem_set.all())
    return total_amount

def pay(request):
    form = ShippingAddressForm()

    if request.method == "POST":
        form = ShippingAddressForm(request.POST)
        if form.is_valid():
            customer = request.user

            # Create a new order for the user each time they make a purchase
            order = Order.objects.create(customer=customer, complete=False)

            # Transfer items from the current cart to the new order
            cart_items = OrderItem.objects.filter(order__customer=customer, order__complete=False)
            for cart_item in cart_items:
                cart_item.order = order
                cart_item.save()

            # Update new order status to complete
            order.complete = True
            order.save()

            # Create a new invoice and associate it with the order
            total_amount = calculate_total_amount(order)  # Implement this function based on your logic
            invoice = Invoice.objects.create(customer=customer, total_amount=total_amount)

            # Associate products with the invoice
            for order_item in order.orderitem_set.all():
                InvoiceItem.objects.create(invoice=invoice, product=order_item.product, quantity=order_item.quantity)

            return redirect('success')

    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        item = order.orderitem_set.all()
    else:
        item = []
        order = {'get_cart_items': 0, 'get_cart_total': 0}
        customer = ''

    context = {'items': item, 'order': order, 'customer': customer, 'form': form}
    return render(request, 'pay.html', context)

def success(request):
    return render(request,'success.html')
def product(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer =customer, complete=False)
        item = order.orderitem_set.all()
    else:
        item = []
        order = {'get_cart_items':0, 'get_cart_total':0}
        customer = ''
    id = request.GET.get('id', '')
    products = Product.objects.filter(id=id)   
    context = {'items':item, 'order':order,'customer': customer, 'products':products}   
    return render(request, 'product.html', context)

def updateItem(request):
    data = json.loads(request.body)
    productId = data['productId']
    action = data['action']
    customer = request.user
    product = Product.objects.get(id = productId)
    order, created = Order.objects.get_or_create(customer =customer, complete=False)
    orderItem, created = OrderItem.objects.get_or_create(order =order, product =product)
    if action == 'add':
        orderItem.quantity += 1
    elif action =='remove':
        orderItem.quantity -=1
    orderItem.save()
    if orderItem.quantity <= 0 or action =='delete':
        orderItem.delete()
    return JsonResponse('added', safe=False)





# Admin
def create_product(request):
    form = ProductForm()
    
    try:
        if request.method == "POST":
            form = ProductForm(request.POST, request.FILES)
            if form.is_valid():
                form.save()
                return redirect('create_product')
        context = {'form':form}
        return render(request, 'admin/create_product.html', context)
    except:
        return render(request, 'admin/create_product.html')
        
def list_product(request):
    return render(request, 'admin/list_product.html')
def update_product(request):
    return render(request, 'admin/update_product.html')





# fp-growth 
def result_fp(request):
    result_fp_data = result_fpGrowth()
    return render(request, 'result_fp.html', {"result": result_fp_data})

def predict_items(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer =customer, complete=False)
        item = order.orderitem_set.all()
    else:
        item = []
        order = {'get_cart_items':0, 'get_cart_total':0}
        customer = ''
        
    predictions = []  # Default value

    if request.method == 'POST':
        form = Predict(request.POST)
        if form.is_valid():
            # Process the form data and perform prediction here
            input_data = form.cleaned_data['name']
            # Assuming result_fpGrowth takes a list as input
            predictions = result_fpGrowth([input_data])
            predictions = set(predictions)
    else:
        form = Predict()
    context = {'items':item, 'order':order,'customer': customer, 'predictions': predictions,'form' :form}

    # return render(request, 'predict_items.html', {'form': form})
    return render(request, 'predict_items.html', context)
