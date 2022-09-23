from django.dispatch import receiver
from django.shortcuts import render,redirect
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
    def __init__(self,request_user_id ,*args, **kwargs):
        
        super(ConversationForm, self).__init__(*args, **kwargs)
        self.fields['receiver']=forms.ModelChoiceField(queryset=User.objects.exclude(id=request_user_id))

    #receiver=forms.ModelChoiceField(queryset=User.objects.exclude(id=request.user.id))
    
    class Meta:
        model=Conversation
        fields='__all__'
        exclude=['expediteur','updated','created']