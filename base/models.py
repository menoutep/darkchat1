from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Topic(models.Model):
    name=models.CharField(max_length=200)
    
    
    def __str__(self):
        return self.name
    
    class Meta: #la classe meta sert a definir des preference relatif a l'affichage du model au niveau de la page d'administration 
        verbose_name="Topic"
        verbose_name_plural="Topics"
    
    
    
class Room(models.Model):
    host=models.ForeignKey(User,on_delete=models.SET_NULL, null=True)
    topic=models.ForeignKey(Topic,on_delete=models.SET_NULL,related_name="rooms",null=True)
    name=models.CharField(max_length=120)
    description=models.TextField(null=True, blank=True)
    participants=models.ManyToManyField(User,related_name="participants", blank=True)
    
    ###  standard   ###
  
    updated=models.DateTimeField(auto_now=True)
    created=models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering=['-updated', '-created'] # ordonne les element d'une entité n'est pas tres recommander car une fois les element ordonné ici, nous ne pouvons plus changer leur ordre par la suite au niveau des vues. c'est pour cela que nous suggerons 
    
    def __str__(self):
        return self.name
    
    
class Message(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    room=models.ForeignKey(Room,on_delete=models.CASCADE)
    body=models.TextField()
    updated=models.DateTimeField(auto_now=True)
    created=models.DateTimeField(auto_now_add=True)
    
    
    class Meta:
        ordering=['-updated', '-created']
    
    
    def __str__(self):
        return self.body[0:50]
    
    
class Conversation(models.Model):
    expediteur=models.ForeignKey(User, on_delete=models.CASCADE,related_name="expediteur")
    receiver=models.ForeignKey(User, on_delete=models.CASCADE, related_name="receiver")
    updated=models.DateTimeField(auto_now=True)
    created=models.DateTimeField(auto_now_add=True)
    class Meta:
        ordering=['-updated', '-created']
    
    def __str__(self):
        return str(self.receiver)
    
    
    
class MessageConversation(models.Model):
    sender=models.ForeignKey(User, on_delete=models.CASCADE)
    conversation=models.ForeignKey(Conversation, on_delete=models.CASCADE)
    body=models.TextField()
    created=models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering=['-created']
    
    
    def __str__(self):
        return self.body[0:50]
    