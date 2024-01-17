# Generated by Django 5.0 on 2024-01-14 10:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store_app', '0006_category'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='category',
            field=models.ManyToManyField(related_name='product', to='store_app.category'),
        ),
    ]
