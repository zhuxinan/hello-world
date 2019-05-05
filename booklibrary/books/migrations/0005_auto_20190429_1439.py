# Generated by Django 2.2 on 2019-04-29 06:39

from django.db import migrations, models
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
        ('books', '0004_heatmap'),
    ]

    operations = [
        migrations.CreateModel(
            name='Messige',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('content', tinymce.models.HTMLField()),
            ],
        ),
        migrations.AlterField(
            model_name='heatmap',
            name='index',
            field=models.SmallIntegerField(unique=True),
        ),
    ]