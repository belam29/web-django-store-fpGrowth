from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

# Create your views here.
def index(request):
    # template = loader.get_template('index.html')
    # return HttpResponse(template.render())
    return render(request, 'index.html')

def contact(request):
    return render(request, 'contact.html')

def cart(request):
    return render(request, 'cart.html')

def listProduct(request):
    return render(request, 'listProduct.html')

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
    return render(request, 'admin/overview.html')