from django.shortcuts import render, redirect
from django.contrib.auth.forms  import UserCreationForm
from .forms import UserForm

# Create your views here.

def register(request):
    if request.method == 'POST':
        form=UserForm(request.POST)
        
        if form.is_valid():
            form.save()
            return redirect('base:home')
    else:
        form=UserForm()
        
    context={
        'form':form,
    }
    return render(request,'accounts/register.html.twig',context)
