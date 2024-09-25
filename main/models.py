from django.db import models

class Education(models.Model):
    school_name = models.CharField(max_length=255)
    degree = models.CharField(max_length=100)
    location = models.CharField(max_length=255)
    start_month = models.IntegerField()
    start_year = models.IntegerField()
    end_month = models.IntegerField(null=True, blank=True) 
    end_year = models.IntegerField(null=True, blank=True) 
    gpa = models.DecimalField(max_digits=3, decimal_places=2)
    coursework = models.TextField()
    activities = models.TextField()
    class Meta:
        managed = False  # Don't let Django manage the table (since it already exists)
        db_table = 'education'  # Use existing table name

class ResearchPaper(models.Model):
    paper_title = models.CharField(max_length=255)
    publication_name = models.CharField(max_length=255)
    publication_date = models.DateField()
    author_names = models.TextField()
    description = models.TextField()
    paper_link = models.URLField(max_length=255)
    class Meta:
        managed = False  # Don't let Django manage the table (since it already exists)
        db_table = 'research_paper'  # Use existing table name

class ResearchProject(models.Model):
    project_title = models.CharField(max_length=255)
    affiliated_institute = models.CharField(max_length=255)
    start_month = models.CharField(max_length=50)
    start_year = models.IntegerField()
    end_month = models.CharField(null=True, blank=True, max_length=50)
    end_year = models.IntegerField(null=True, blank=True)
    description = models.TextField()
    technologies_used = models.TextField()
    project_link = models.URLField(max_length=255)
    class Meta:
        managed = False  # Don't let Django manage the table (since it already exists)
        db_table = 'research_projects'  # Use existing table name


class WorkExperience(models.Model):
    organization_name = models.CharField(max_length=255)
    job_title = models.CharField(max_length=255)
    location = models.CharField(max_length=255)
    start_month = models.CharField(max_length=50)
    start_year = models.IntegerField()
    end_month = models.CharField(null=True, blank=True, max_length=50)
    end_year = models.IntegerField(null=True, blank=True)
    responsibilities = models.TextField()
    achievements = models.TextField()
    class Meta:
        managed = False  # Don't let Django manage the table (since it already exists)
        db_table = 'work_experience'  # Use existing table name

class Certification(models.Model):
    certification_title = models.CharField(max_length=255)
    issuing_organization = models.CharField(max_length=255)
    issue_date = models.DateField()
    expiry_date = models.DateField(null=True, blank=True)
    score = models.CharField(max_length=50, blank=True, null=True)
    duration = models.CharField(max_length=50, blank=True, null=True)
    description = models.TextField()
    class Meta:
        managed = False  # Don't let Django manage the table (since it already exists)
        db_table = 'certifications'  # Use existing table name

class Award(models.Model):
    award_title = models.CharField(max_length=255)
    award_date = models.DateField()
    competition_name = models.CharField(max_length=255)
    description = models.TextField()
    class Meta:
        managed = False  # Don't let Django manage the table (since it already exists)
        db_table = 'awards'  # Use existing table name

class ClubActivity(models.Model):
    club_name = models.CharField(max_length=255)
    position = models.CharField(max_length=255)
    responsibilities = models.TextField()
    class Meta:
        managed = False  # Don't let Django manage the table (since it already exists)
        db_table = 'club_activities'  # Use existing table name

