# Generated by Django 2.2 on 2019-04-26 09:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('books', '0002_auto_20190426_1750'),
    ]

    operations = [
        migrations.AlterField(
            model_name='borrowhistory',
            name='darereturn',
            field=models.DateTimeField(),
        ),
    ]
