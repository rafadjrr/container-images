# Generated by Django 3.0.6 on 2022-07-12 16:57

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Tasas',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fuente', models.CharField(max_length=32)),
                ('mon_num', models.CharField(max_length=5, verbose_name='moneda numerador')),
                ('mon_den', models.CharField(max_length=5, verbose_name='moneda denominador')),
                ('fecha', models.DateField()),
                ('item', models.PositiveSmallIntegerField()),
                ('idfuente', models.CharField(blank=True, max_length=30, null=True)),
                ('tasa', models.FloatField()),
                ('hora', models.TextField(blank=True, null=True)),
                ('medio', models.CharField(max_length=16)),
                ('textorg', models.CharField(max_length=256, verbose_name='texto original')),
                ('cambiopor', models.FloatField(blank=True, null=True, verbose_name='cambio porcentual')),
                ('cambioabs', models.FloatField(blank=True, null=True, verbose_name='cambio absoluto')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'verbose_name_plural': 'Tasas',
            },
        ),
    ]