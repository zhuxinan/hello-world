# Generated by Django 2.2 on 2019-04-24 11:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('blogs', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='blogcategory',
            options={'verbose_name': '博客分类', 'verbose_name_plural': '博客分类'},
        ),
        migrations.AlterModelOptions(
            name='bloguser',
            options={'verbose_name': '用户', 'verbose_name_plural': '用户'},
        ),
        migrations.AlterModelOptions(
            name='comment',
            options={'ordering': ['-pub_date'], 'verbose_name': '评论', 'verbose_name_plural': '评论'},
        ),
        migrations.AlterModelOptions(
            name='post',
            options={'verbose_name': '博客', 'verbose_name_plural': '博客'},
        ),
        migrations.AlterModelOptions(
            name='tags',
            options={'verbose_name': '标签', 'verbose_name_plural': '标签'},
        ),
        migrations.AlterField(
            model_name='comment',
            name='pub_date',
            field=models.DateTimeField(auto_now_add=True, verbose_name='发布时间'),
        ),
        migrations.AlterField(
            model_name='post',
            name='category',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='blogs.BlogCategory', verbose_name='博客分类'),
        ),
    ]