# authentication/validators.py
from django.core.exceptions import ValidationError


class TailleMinValidator:
    def validate(self, password, user=None):
        if len(password)<8:
            raise ValidationError(
                'Le mot de passe doit contenir au moins 8 characteres', code='password_no_letters')
                
    def get_help_text(self):
        return 'Votre mot de passe doit contenir au moins 8 characteres.'