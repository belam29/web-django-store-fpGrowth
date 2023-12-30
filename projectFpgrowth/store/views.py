from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from .models import Product, User
from .fp_growth.fp_growth import result_fpGrowth
from django.contrib.auth.decorators import login_required


# Create your views here.
def index(request):
    # template = loader.get_template('index.html')
    # return HttpResponse(template.render())
    products = Product.objects.all()
    return render(request, 'index.html', {'products': products})

def contact(request):
    return render(request, 'contact.html')

def cart(request):
    return render(request, 'cart.html')

def result_fp(request):
    result = result_fpGrowth()
    return render(request, 'result_fp.html', {"result": result})
    
def listProduct(request):
    products = Product.objects.all()
    return render(request, 'listProduct.html', {'products': products})

def news(request):
    return render(request, 'news.html')

def pay(request):
    return render(request, 'pay.html')

def product(request):
    return render(request, 'product.html')

def SignIn(request):
    return render(request, 'Login/signIn.html')

def SignUp(request):
    return render(request, 'Login/signUp.html')

def User(request):
    user_dn = User.object()
    return render(request, 'admin/overview.html', {'user':user_dn})