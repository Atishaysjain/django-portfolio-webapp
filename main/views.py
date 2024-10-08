from django.shortcuts import render
from .models import Education, ResearchPaper, ResearchProject, WorkExperience, Certification, Award, ClubActivity
import os
from django.shortcuts import render
from django.core.mail import send_mail
from django.conf import settings
from django.http import JsonResponse
from django.contrib import messages
from .forms import ContactForm

import openai

def home(request):
    return render(request, 'home.html')

def about(request):
    return render(request, 'about.html')

def education(request):
    education_entries = Education.objects.all()
    return render(request, 'education.html', {'education_entries': education_entries})

def research(request):
    papers = ResearchPaper.objects.all()
    projects = ResearchProject.objects.all()
    return render(request, 'research.html', {'papers': papers, 'projects': projects})

def work_experience(request):
    work_entries = WorkExperience.objects.all()
    return render(request, 'work_experience.html', {'work_entries': work_entries})

def publications(request):
    all_publications = ResearchPaper.objects.all()
    return render(request, 'publications.html', {'publications': all_publications})

def honors_awards(request):
    certifications = Certification.objects.all()
    awards = Award.objects.all()
    return render(request, 'honors_awards.html', {'certifications': certifications, 'awards': awards})

def mentoring_leadership(request):
    club_activities = ClubActivity.objects.all()
    return render(request, 'mentoring_leadership.html', {'club_activities': club_activities})

def powell_gpt(request):

    if request.method == 'POST':
        
        user_message = request.POST.get('message')
        with open(os.path.join('main', 'static', 'subject_information', 'portfolio.txt'), 'r') as f:
            subject_portfolio = f.read()

        client = openai.Client(api_key=settings.OPENAI_API_KEY)
        completion = client.chat.completions.create(
            model="chatgpt-4o-latest",
            messages=[
                {"role": "system", "content": f"Answer the question based on the following information: {subject_portfolio}.\n\n If the answer to the question is not in the information, please respond with 'I don't know'."},
                {
                    "role": "user",
                    "content": user_message
                }
            ]
        )

        # Get the response from GPT
        bot_response = completion.choices[0].message.content

        # Return response as JSON
        return JsonResponse({'message': bot_response})
    
    return render(request, 'powell_gpt.html')

def gallery(request):

    workplace_photos = [
        {"url": "images/workplace1.jpg", "alt": "Workplace Photo 1"},
        {"url": "images/workplace2.jpg", "alt": "Workplace Photo 2"},
    ]
    hobby_photos = [
        {"url": "images/hobby1.jpg", "alt": "Hobby Photo 1"},
        {"url": "images/hobby2.jpg", "alt": "Hobby Photo 2"},
    ]
    context = {
        'workplace_photos': workplace_photos,
        'hobby_photos': hobby_photos,
    }
    return render(request, 'gallery.html', context)

def contact(request):
    if request.method == 'POST':
        # handle form submission
        pass
    return render(request, 'contact.html')


def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']
            subject = form.cleaned_data['subject']
            message = form.cleaned_data['message']

            # Send email
            send_mail(
                subject=f"{subject} (from {name})",  # Email subject
                message=f"Message from {name} ({email}):\n\n{message}",  # Email body
                from_email=settings.EMAIL_HOST_USER,  # The email sending the message
                recipient_list=[settings.EMAIL_HOST_USER],  # The email(s) that will receive the message
                fail_silently=False,  # Raise errors if email fails
            )

            # Show success message
            messages.success(request, 'Thank you for your message. We will get back to you shortly.')
            return render(request, 'contact.html', {'form': ContactForm()})  # Reset form after successful submission
    else:
        form = ContactForm()

    return render(request, 'contact.html', {'form': form})

