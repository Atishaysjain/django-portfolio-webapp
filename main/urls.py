from django.urls import path
from . import views


urlpatterns = [
    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('education/', views.education, name='education'),
    path('research/', views.research, name='research'),
    path('work-experience/', views.work_experience, name='work_experience'),
    path('publications/', views.publications, name='publications'),
    path('mentoring-leadership/', views.mentoring_leadership, name='mentoring_leadership'),
    path('honors-awards/', views.honors_awards, name='honors_awards'),
    path('powell-gpt/', views.powell_gpt, name='powell_gpt'),
    path('gallery/', views.gallery, name='gallery'),
    path('contact/', views.contact, name='contact'),
]