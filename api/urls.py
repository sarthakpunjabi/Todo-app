from django.urls import path

from .views import getNotes, getRoutes,createNote,updateNote,deleteNote

urlpatterns = [
    path('',getRoutes,name="Include"),
    path('notes/',getNotes),
    path('notes/create/',createNote),
    path('notes/<str:pk>/update/',updateNote),
    path('notes/<str:pk>/delete/',deleteNote),
    path('notes/<str:pk>',getNotes)

]