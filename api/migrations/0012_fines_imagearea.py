# Generated by Django 4.0.4 on 2022-06-28 05:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0011_remove_fines_finetitle_remove_fines_penallymoney_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='fines',
            name='imageArea',
            field=models.ImageField(blank=True, null=True, upload_to='finesImage'),
        ),
    ]
