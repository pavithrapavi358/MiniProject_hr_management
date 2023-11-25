# Generated by Django 3.2.20 on 2023-11-08 12:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('hr_app', '0008_remove_attendexam_status'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='interview',
            name='ATTEND',
        ),
        migrations.AddField(
            model_name='interview',
            name='APPLICATION',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='hr_app.application'),
            preserve_default=False,
        ),
    ]
