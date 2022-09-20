from django.dispatch import receiver
from django.forms import ModelForm, TextInput,EmailInput, Textarea

from .models import Room, Topic,Conversation
from django.contrib.auth.models import User
from django import forms
from django.core.exceptions import ValidationError

class RoomForm(ModelForm):
    topic = forms.ModelChoiceField(queryset=Topic.objects.all())
    name = forms.CharField(max_length=100)
    description=forms.CharField(widget=forms.Textarea)
    
    
    class Meta:
        model=Room
        fields='__all__'
        exclude=['host','participants']
        
class ConversationForm(ModelForm):
    receiver=forms.ModelChoiceField(queryset=User.objects.all())
    
    class Meta:
        model=Conversation
        fields='__all__'
        exclude=['expediteur','updated','created']