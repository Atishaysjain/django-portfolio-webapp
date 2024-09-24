from django.db import models

class Education(models.Model):
    school_name = models.CharField(max_length=255)
    degree = models.CharField(max_length=255)
    location = models.CharField(max_length=255)
    start_year = models.IntegerField()  # Year fields are integers, no need for nullable unless required
    end_year = models.IntegerField(null=True, blank=True)  # Allow end_year to be blank or null
    gpa = models.DecimalField(max_digits=4, decimal_places=2, null=True, blank=True)  # GPA can be null or blank

class ResearchPaper(models.Model):
    title = models.CharField(max_length=255)
    publication_name = models.CharField(max_length=255)
    publication_date = models.DateField()
    author_names = models.CharField(max_length=255)
    paper_link = models.URLField(null=True, blank=True)  # Optional URL

class ResearchProject(models.Model):
    title = models.CharField(max_length=255)
    start_year = models.IntegerField()
    end_year = models.IntegerField(null=True, blank=True)  # Optional end year
    description = models.TextField()

class WorkExperience(models.Model):
    organization_name = models.CharField(max_length=255)
    job_title = models.CharField(max_length=255)
    start_year = models.IntegerField()
    end_year = models.IntegerField(null=True, blank=True)  # Allow end_year to be blank or null
    responsibilities = models.TextField()

class Publication(models.Model):
    title = models.CharField(max_length=255)
    publication_type = models.CharField(max_length=100)  # e.g., Research Paper, Article, Book
    publication_name = models.CharField(max_length=255)  # Name of the journal or publisher
    publication_date = models.DateField()
    author_names = models.CharField(max_length=255)
    link = models.URLField(null=True, blank=True)  # Optional URL

class Certification(models.Model):
    title = models.CharField(max_length=255)
    issuing_organization = models.CharField(max_length=255)
    issue_date = models.DateField()
    expiry_date = models.DateField(null=True, blank=True)  # Optional expiry date
    description = models.TextField(null=True, blank=True)  # Optional description

class Award(models.Model):
    title = models.CharField(max_length=255)
    award_date = models.DateField()
    description = models.TextField(null=True, blank=True)  # Optional description

class MentoringActivity(models.Model):
    activity_title = models.CharField(max_length=255)
    organization = models.CharField(max_length=255)
    start_date = models.DateField()
    end_date = models.DateField(null=True, blank=True)  # Optional end date
    description = models.TextField(null=True, blank=True)  # Optional description

class Testimonial(models.Model):
    name = models.CharField(max_length=255)
    feedback = models.TextField()
