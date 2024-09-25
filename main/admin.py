# Register your models here.
from django.contrib import admin
from .models import Education, ResearchPaper, ResearchProject, WorkExperience, Certification, Award, ClubActivity

admin.site.register(Education)
admin.site.register(ResearchPaper)
admin.site.register(ResearchProject)
admin.site.register(WorkExperience)
admin.site.register(Certification)
admin.site.register(Award)
admin.site.register(ClubActivity)
