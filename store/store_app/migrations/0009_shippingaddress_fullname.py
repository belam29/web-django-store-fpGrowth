# Generated by Django 5.0 on 2024-01-14 15:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store_app', '0008_product_detail'),
    ]

    operations = [
        migrations.AddField(
            model_name='shippingaddress',
            name='fullname',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
