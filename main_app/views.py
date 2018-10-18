from django.shortcuts import render
#from django.http import HttpResponse
from .models import Treasure

# Create your views here.
def index(request):
	treasures = Treasure.objects.all()
	return render(request, 'index.html', {'treasures':treasures})

"""
class Treasure:
	def __init__(self, name, value, material, location, img_url):
		self.name = name
		self.value = value
		self.material = material
		self.location = location
		self.img_url = img_url

treasures = [ 
	Treasure('Gold Nuggets', 500.00, 'Gold', 'Bangalore', 'https://cdn0.iconfinder.com/data/icons/ie_Bright/512/gold.png'),
	Treasure('Wood Plank', 0.00, 'Wood', 'Chennai', 'https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/planks.png'),
	Treasure('Iron Bars', 100.00, 'Iron Ferrite', 'Kerala', 'http://www.amsteel.com.my/Image/Icon/steelbar.jpg'),
	Treasure('Diamond Peices', 2500.00, 'Diamond', 'Andhra Pradesh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKBsbuy6kO4_sOWm5g2V5jpANGjGdDIuqfhcwxF7pZtSXmwfvi'),
]
"""
