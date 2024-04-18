from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout
from .models import Category, Product, Cart, User
from myapp.forms import RegistrationForm
from django.db.models import Q
from django.shortcuts import get_object_or_404

def add_to_cart(request):
    if request.method == 'POST':
        product_id = request.POST.get('product_id')  # Получаем идентификатор товара из POST-запроса
        if 'cart' not in request.session:
            request.session['cart'] = {}

        cart = request.session['cart']
        cart[product_id] = cart.get(product_id, 0) + 1
        request.session.modified = True

    return redirect('cart')

def remove_from_cart(request):
    if request.method == 'POST':
        product_id = request.POST.get('product_id')  # Получаем идентификатор товара из POST-запроса
        cart = request.session.get('cart', {})
        if product_id in cart:
            del cart[product_id]
            request.session['cart'] = cart
            request.session.modified = True

    return redirect('cart')

def view_cart(request):
    cart = request.session.get('cart', {})
    total_price = 0  # Вы можете вычислить общую стоимость товаров здесь
    return render(request, 'cart.html', {'cart': cart, 'total_price': total_price})

def checkout(request):
    if request.method == 'POST':

        order_placed = True
        return render(request, 'checkout.html', {'order_placed': order_placed})
    else:
        # Отображение формы оформления заказа
        return render(request, 'checkout.html')

    
def register_view(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = RegistrationForm()
    return render(request, 'register.html', {'form': form})

def login_view(request):
    if request.method == 'POST':
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect('home')
    else:
        form = AuthenticationForm()
    return render(request, 'login.html', {'form': form})

def logout_view(request):
    logout(request)
    return redirect('home')

def home(request):
    return render(request, 'home.html')

def catalog(request):
    products = Product.objects.all()
    return render(request, 'catalog.html', {'products': products})

def about(request):
    return render(request, 'about.html')

def location(request):
    return render(request, 'location.html')

def product_detail(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    return render(request, 'product_detail.html', {'product': product})


def catalog_view(request):
    categories = Category.objects.all()
    products = Product.objects.all()
    category_name = request.GET.get('category')

    if category_name:
        products = products.filter(category__name=category_name)

    return render(request, 'catalog.html', {'products': products, 'categories': categories})


