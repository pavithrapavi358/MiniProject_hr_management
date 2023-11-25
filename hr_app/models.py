from django.db import models

# Create your models here.
from django.db.models import CASCADE


class Login(models.Model):
    username = models.CharField(max_length=30)
    password = models.CharField(max_length=30)
    type = models.CharField(max_length=30)


class Hr(models.Model):
    LOGIN = models.ForeignKey(Login, on_delete=models.CASCADE)
    name = models.CharField(max_length=30)
    place = models.CharField(max_length=30)
    post = models.CharField(max_length=30)
    pin = models.BigIntegerField()
    phone = models.BigIntegerField()
    email = models.EmailField()
    photo = models.FileField()
    deparment=models.CharField(max_length=900)


class Candidate(models.Model):
    LOGIN = models.ForeignKey(Login, on_delete=models.CASCADE)
    name = models.CharField(max_length=30)
    place = models.CharField(max_length=30)
    post = models.CharField(max_length=30)
    pin = models.BigIntegerField()
    phone = models.BigIntegerField()
    email = models.EmailField()
    photo = models.FileField()
    qualification = models.CharField(max_length=30)
    proof = models.FileField()


class Vacancy(models.Model):
    vacancy_name = models.CharField(max_length=30)
    no_of_vacancy = models.IntegerField()
    Vacancy_details = models.CharField(max_length=80)
    Qualification = models.CharField(max_length=30)
    date = models.DateField()
    tdate = models.DateField()
    ttime = models.TimeField()
    HR = models.ForeignKey(Hr, on_delete=models.CASCADE)


class Application(models.Model):
    VACANCY = models.ForeignKey(Vacancy, on_delete=models.CASCADE)
    CANDIDATE = models.ForeignKey(Candidate, on_delete=models.CASCADE)
    date = models.DateField()
    status = models.CharField(max_length=30)


class Question(models.Model):
    VACANCY = models.ForeignKey(Vacancy, on_delete=models.CASCADE)
    questions = models.CharField(max_length=300)
    op1 = models.CharField(max_length=300)
    op2 = models.CharField(max_length=300)
    op3 = models.CharField(max_length=300)
    op4 = models.CharField(max_length=300)
    Answers = models.CharField(max_length=200)


class AttendExam(models.Model):
    date = models.DateField()
    Mark = models.CharField(max_length=30)
    CANDIDATE = models.ForeignKey(Candidate, on_delete=models.CASCADE)
    QUESTION = models.ForeignKey(Question, on_delete=models.CASCADE)


class Interview(models.Model):
    APPLICATION = models.ForeignKey(Application, on_delete=models.CASCADE)
    venue = models.CharField(max_length=80)
    date = models.DateField()
    time = models.TimeField()
    status = models.CharField(max_length=30)
    score = models.CharField(max_length=30)


