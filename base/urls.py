"""studyBud URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.urls import path

from base import views

app_name='base'

urlpatterns = [
    path('',views.home, name='home'),
   
    path('room/<str:pk>/', views.room, name='room'),
    path('conversation-index/', views.conversationIndex, name='conversation-index'),
    path('create-room/', views.createRoom, name="create-room"),
    path('create-conversation/', views.createConversation, name="create-conversation"),
    path('conversation/<str:pk>/', views.conversation, name="conversation"),
    path('update-room/<str:pk>', views.updateRoom, name="update-room"),
    path('delete-room/<str:pk>', views.deleteRoom, name="delete-room"),
    path('delete-conversation/<str:pk>', views.deleteConversation, name="delete-conversation"),
    path('delete-message/<str:pk>', views.deleteMessage, name="delete-message"),
    path('profile/<str:pk>', views.userProfile, name="user-profile"),
    path('settings/', views.setting, name="setting"),

    

    
]
