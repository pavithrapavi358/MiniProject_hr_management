# Generated by Django 3.2.22 on 2023-11-24 09:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hr_app', '0013_hr_deparment'),
    ]

    operations = [
        migrations.AlterField(
            model_name='question',
            name='op1',
            field=models.CharField(max_length=300),
        ),
        migrations.AlterField(
            model_name='question',
            name='op2',
            field=models.CharField(max_length=300),
        ),
        migrations.AlterField(
            model_name='question',
            name='op3',
            field=models.CharField(max_length=300),
        ),
        migrations.AlterField(
            model_name='question',
            name='op4',
            field=models.CharField(max_length=300),
        ),
    ]
