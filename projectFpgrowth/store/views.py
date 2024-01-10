from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from .models import Product, User
from .fp_growth.fp_growth import result_fpGrowth, predict_fpGrowth, fp_growth
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .models import Transaction
from django.shortcuts import get_object_or_404
from .models import OrderDetail, Product
from .form import UserInputForm


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
    top_predictions, result_fp_data = result_fpGrowth()
    return render(request, 'result_fp.html', {"result": result_fp_data})
    
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


def predict_items(request):
    form = UserInputForm(request.POST or None)

    if request.method == 'POST' and form.is_valid():
        user_input = form.cleaned_data['user_input']
    
        # Gọi hàm từ fp_growth.py để xử lý dữ liệu
        predictions = result_fpGrowth(user_input)
        
        return render(request, 'predict_items.html', {'form': form, 'predictions': predictions})

    return render(request, 'predict_items.html', {'form': form})

# ################################################################################
