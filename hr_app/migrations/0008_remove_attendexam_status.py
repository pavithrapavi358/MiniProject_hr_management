# Generated by Django 3.2.20 on 2023-11-08 05:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hr_app', '0007_remove_vacancy_company_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='attendexam',
            name='status',
        ),
    ]
