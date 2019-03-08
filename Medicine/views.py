from django.shortcuts import render
#from django.http import HttpResponse
from .models import Medicine

# Create your views here.
def index(request):
	medicines = Medicine.objects.all()
	return render(request, 'index.html', {'medicines':medicines})
