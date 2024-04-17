from django.shortcuts import render

from item.models import Item

# Create your views here.
def search(request):
    category = request.GET.get('search')
    if category:
        items = Item.objects.filter(category=category)
    else:
        items = Item.objects.all()
    return render(request, 'base.html', {'items':items, 'category': category})