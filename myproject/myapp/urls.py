from django.urls import path
from . import views
from .views import add_to_cart, view_cart, catalog_view  

urlpatterns = [
    path('', views.home, name='home'),
    path('catalog/', views.catalog_view, name='catalog_view'),
    path('catalog/<str:category>/', views.catalog_view, name='catalog_view'),
    path('product/<int:product_id>/', views.product_detail, name='product_detail'),
    path('about/', views.about, name='about'),
    path('location/', views.location, name='location'),
    path('register/', views.register_view, name='register'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('checkout/', views.checkout, name='checkout'),
    path('add_to_cart/', add_to_cart, name='add_to_cart'),
    path('cart/', view_cart, name='cart'),
    path('remove_from_cart/', views.remove_from_cart, name='remove_from_cart'),
]