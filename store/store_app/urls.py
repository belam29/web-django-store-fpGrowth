from django.contrib import admin
from django.urls import include, path
from . import views

urlpatterns = [    
    path('', views.index, name='index'),
    path('contact/', views.contact, name='contact'),
    path('listProduct/', views.listProduct, name='listProduct'),
    path('detail_product/', views.product, name='detail_product'),
    path('pay/', views.pay, name='pay'),
    path('news/', views.news, name='news'),
    path('cart/', views.cart, name='cart'),
    path('signIn/', views.SignIn, name='signIn'),
    path('signUp/', views.SignUp, name='signUp'),
    path('result/', views.result_fp, name="result"),
    path('predict_items/', views.predict_items, name='predict_items'),
    path('update_item/', views.updateItem, name="update_item"),
    path('logout/', views.logoutPage, name='logout'),
    path('search/', views.search, name='search'),
    path('category/', views.category, name='category'),
    path('success/', views.success, name='success'),
    
    path('create/', views.create_product, name='create_product'),
    path('list/', views.list_product, name='list_product'),
    path('update/', views.update_product, name='update_product'),
]