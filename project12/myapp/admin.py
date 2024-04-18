from django.contrib import admin
from .models import User, Order, ItemInOrder, Cart, Product, Category

admin.site.register(User)
admin.site.register(Order)
admin.site.register(ItemInOrder)
admin.site.register(Cart)
admin.site.register(Product)
admin.site.register(Category)
