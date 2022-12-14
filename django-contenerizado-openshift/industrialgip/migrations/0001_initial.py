# Generated by Django 3.0.6 on 2022-06-22 14:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Empresa',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion', models.CharField(max_length=50)),
            ],
            options={
                'verbose_name_plural': 'empresa',
            },
        ),
        migrations.CreateModel(
            name='Linea',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion', models.CharField(max_length=50)),
            ],
            options={
                'verbose_name_plural': 'Linea',
            },
        ),
        migrations.CreateModel(
            name='MateriaPrima',
            fields=[
                ('cod_arti', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('descripcion', models.TextField()),
                ('empresadestino', models.CharField(max_length=12)),
            ],
            options={
                'verbose_name_plural': 'Materia Prima',
            },
        ),
        migrations.CreateModel(
            name='TP',
            fields=[
                ('cod_arti', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('descripcion', models.CharField(max_length=50)),
            ],
            options={
                'verbose_name_plural': 'Trama en Proceso',
            },
        ),
        migrations.CreateModel(
            name='Turno',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion', models.CharField(max_length=50)),
                ('horario', models.CharField(max_length=50)),
            ],
            options={
                'verbose_name_plural': 'Turno',
            },
        ),
        migrations.CreateModel(
            name='Programado',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField()),
                ('cantidadkg', models.FloatField(default=0)),
                ('estatus', models.CharField(choices=[('PEND', 'Pendiente'), ('TERM', 'Terminado')], max_length=4)),
                ('empresa', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='industrialgip.Empresa')),
                ('linea', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='industrialgip.Linea')),
                ('tp', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='industrialgip.TP')),
            ],
            options={
                'verbose_name_plural': 'Programado',
            },
        ),
        migrations.CreateModel(
            name='DiarioProd',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField()),
                ('hora', models.TimeField()),
                ('kilosp', models.FloatField(default=0)),
                ('desperdicios', models.IntegerField(default=0)),
                ('idrack', models.IntegerField(blank=True)),
                ('observaciones', models.TextField(blank=True, max_length=256)),
                ('Programado', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='industrialgip.Programado')),
                ('turno', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='industrialgip.Turno')),
            ],
            options={
                'verbose_name_plural': 'Diario de Produccion',
            },
        ),
        migrations.CreateModel(
            name='DiarioMP',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField()),
                ('ingresokg', models.FloatField(default=0)),
                ('consumokg', models.FloatField(default=0)),
                ('inventariofinalkg', models.FloatField(default=0, null=True)),
                ('observaciones', models.TextField(blank=True, max_length=256)),
                ('linea', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='industrialgip.Linea')),
                ('materiaprima', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='industrialgip.MateriaPrima')),
                ('producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='industrialgip.Programado')),
                ('turno', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='industrialgip.Turno')),
            ],
            options={
                'verbose_name_plural': 'Diario de materia prima',
            },
        ),
    ]
