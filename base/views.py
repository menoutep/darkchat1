import logging
from django.dispatch import receiver
from django.shortcuts import render,redirect
from .models import Room, Topic, Message, MessageConversation, Conversation
from .forms import RoomForm, ConversationForm
from django.db.models import Q
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator 
from django.contrib.auth.models import User
# Create your views here.



def home(request):
    #cette ligne permet de recuperer le parametre q passer en parametre precedemment dans la vue index.html.twig
    q= request.GET.get('q') if request.GET.get('q') != None else ''
    topics=Topic.objects.all()
    
    #cette ligne permet de trier les rooms en fonctions du parametre q auquels on a passer dan la vue la valeur contenue dans le champs topic_name, l'utilistation de Q permet de trier les rooms en fonctions de plusieurs champs
    rooms=Room.objects.filter(Q(topic__name__icontains=q) |
                              Q(name__icontains=q) | 
                              Q(description__icontains=q))
    #la methode count() permet de renvoyer le nombre d'occurence d'une entité
    #cette ligne permet de faire une paginitation grace a la classe Paginator
    paginator=Paginator(rooms, 3)
    page_number=request.GET.get('page')
    page_object=paginator.get_page(page_number)
    room_count=rooms.count()
    
    rooms_message=Message.objects.filter(Q(room__topic__name__icontains=q))[:3]
    context={
        'rooms':page_object,
        'topics':topics,
        'room_count':room_count,
        'messages':rooms_message,
    }
    return render(request,'base/index.html',context)
# la fonction conversationIndex permet de lister toute les conversation de l'utilisateur, 


@login_required
def conversationIndex(request):
    
    topics=Topic.objects.all()
    q=request.user.username
    conversations=Conversation.objects.filter(Q(expediteur__username__icontains=q) |
                              Q(receiver__username__icontains=q))
    
    #cette ligne permet de faire une paginitation grace a la classe Paginator
    paginator=Paginator(conversations, 3)
    page_number=request.GET.get('page')
    page_object=paginator.get_page(page_number)
    conversation_count=conversations.count()
    context={
        'topics':topics,
        'conversations':page_object,
        'conversation_count':conversation_count, 
        
    }
    return render(request, 'base/conversation_index.html',context)


def userProfile(request,pk):
    user=User.objects.get(id=pk)
    rooms=user.room_set.all()
    paginator=Paginator(rooms,3)
    page_number=request.GET.get('page')
    page_object=paginator.get_page(page_number)
    room_count=rooms.count()
    room_message=user.message_set.all()
    topics=Topic.objects.all()
    context={
        'room_count':room_count,
        'user':user,
        'rooms':page_object,
        'messages':room_message,
        'topics':topics,
    }
    return render(request,'base/profile.html',context)


@login_required
def room(request,pk):
    room=Room.objects.get(id=pk)
    #room.message_set.all() permet de recuperer tout les messages poster dans la room
    room_messages=room.message_set.all().order_by('-created')
    if request.method == 'POST':
        message=Message.objects.create(
            user=request.user,
            room=room,
            body=request.POST.get('body')
            
            
        )
        room.participants.add(request.user)
        return redirect('base:room', pk=room.id)
    context={
        'room':room,
        'room_messages':room_messages,
       
    }
    return render(request,'base/room.html',context)
#la fonction conversation fait le details d'une conversation elle constitute la session de chat 
@login_required
def conversation(request,pk):
    discussion=Conversation.objects.get(id=pk)
    messages_conversation=discussion.messageconversation_set.all().order_by('-created')
    if request.method=='POST':
        message=MessageConversation.objects.create(
            sender=request.user,
            conversation=discussion,
            body=request.POST.get('body'),
        )
    
        return redirect('base:conversation', pk=discussion.id)
    context={
        'conversation':discussion,
        'conversation_messages':messages_conversation,  
    }
    return render(request,'base/conversation.html',context)



@login_required
def createRoom(request):
    topics=Topic.objects.all()
    form=RoomForm()
    if request.method == 'POST':
        form=RoomForm(request.POST)
        
        if form.is_valid():
            room=form.save(commit=False)
            room.host=request.user
            
            room.save()
            return redirect('base:home')
        else:
            print("no validated")
    
    context={
        'form':form,
        'topics':topics,  
    }
    return render(request,'base/room_form.html',context)


@login_required
def createConversation(request):
    form=ConversationForm()
    if request.method == 'POST':
        q=request.user
        list_conv=Conversation.objects.filter(Q(expediteur__username__icontains=q) |
                              Q(receiver__username__icontains=q))
    
        r=int(request.POST.get('receiver'))
        #a corriger au niveau du if
        print(r)
        for conv in list_conv:
            print(conv.receiver.id)
            if r==conv.receiver.id :
                return redirect('base:conversation', pk=conv.id)
            if r==conv.expediteur.id :
                return redirect('base:conversation', pk=conv.id)
        form=ConversationForm(request.POST)
        if form.is_valid():
            conversation=form.save(commit=False)
            conversation.expediteur=request.user
            conversation.save()
            return redirect('base:conversation-index')
        
    context={
        'form':form,
        
    }
    
    return render(request,'base/create_conversation.html',context)


@login_required
def updateRoom(request,pk):
    topics=Topic.objects.all()
    room=Room.objects.get(id=pk)
    form=RoomForm(instance=room)
    if request.user != room.host:
        return redirect('base:home')
    if request.method == 'POST':
        form=RoomForm(request.POST, instance=room)
        if form.is_valid():
            form.save()
            return redirect('base:home')
    context={'form':form, 'topics':topics}
    return render(request,'base/room_form.html',context)
    
    
    
@login_required    
def deleteRoom(request,pk):
    room=Room.objects.get(id=pk)
    if request.method == 'POST':
        room.delete()
        return redirect('base:home')
    
    return render(request,'base/delete.html',{'obj':room})


@login_required    
def deleteConversation(request,pk):
    conversation=Conversation.objects.get(id=pk)
    if request.method == 'POST':
        conversation.delete()
        return redirect('base:conversation-index')
    
    return render(request,'base/delete_conversation.html',{'obj':conversation})



@login_required
def deleteMessage(request,pk):
    message=Message.objects.get(id=pk)
    room=Room.objects.get(id=message.room.id)
    if request.user.username == message.user.username:
        message.delete()
        return redirect('base:room',pk=room.id )
    
    return redirect('base:room',pk=room.id )





def setting(request):
    return render(request,'base/settings.html')