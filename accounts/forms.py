from django import forms
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
class LoginForm(AuthenticationForm):
    username=forms.CharField(label='Username', widget=forms.TextInput(attrs={
        'class':'form-control',
    }))
    password=forms.CharField(label='Password', widget=forms.PasswordInput(attrs={
        'class':'form-control',
    }))
    
    
    
class UserForm(UserCreationForm):
    username=forms.CharField(label='Username', widget=forms.TextInput(attrs={
        'class':'form-control',
    }))
    email=forms.CharField(label='E-mail', widget=forms.EmailInput(attrs={
        'class':'form-control',
    }))
    password1=forms.CharField(label='Password', widget=forms.PasswordInput(attrs={
        'class':'form-control',
    }))
    password2=forms.CharField(label='confirm your password', widget=forms.PasswordInput(attrs={
        'class':'form-control',
    }))

    #pour valider l'attribut ou la valeur du champ password1, on utilise la méthode clean_nomduchamp comme suit. cette methode est plus adapté lorsque on veut valider un seul champs, faire attention car ici cette methode nous fais manipuler la valeur du champs sour sa forme objet d'ou l'utilisation du self
    def clean_password1(self):
        data = self.cleaned_data['password1']
        if len(data) < 8:
            raise ValidationError(('Invalid size value it is too short, try with 8 minimun characters: %(value)s'), code='invalid_size', params={'value': data},)
        
        
              
        # Always return a value to use as the new cleaned data, even if
        # this method didn't change it.
        return data
    #Remarquez que nous parlons bien maintenant de la méthode clean() du formulaire, alors qu’auparavant nous avions écrit une méthode clean() pour un champ. Il est important de bien faire la différence entre le champ et le formulaire lorsqu’il s’agit de la validation de contenu. Les champs sont des points de données uniques, les formulaires sont des ensembles de champs.
    #pour valider l'attribut ou la valeur du champ password2 on utilise la methode clean(), cette methode est plus adapter lorsque la validation d'un champs se fera en fonction de la valeur contenu dans un champs qui le precede. cette methode renvoie le dictionnaire cleaned_data
    
                
    
    
    class Meta:
        model=User
        fields=('username','email','password1','password2')