# Generated by Django 2.2 on 2019-04-24 13:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blogs', '0002_auto_20190424_1931'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='pub_date',
            field=models.DateTimeField(auto_now=True, verbose_name='发布日期'),
        ),
    ]
