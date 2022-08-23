#sleep 90s

# Restore de la base de datos andisacos en la imagen
# https://docs.microsoft.com/en-us/sql/linux/tutorial-restore-backup-in-sql-server-container?view=sql-server-ver15
#/opt/mssql-tools/bin/sqlcmd \
#-S localhost -U SA -P '123456Ps' \
#-Q 'RESTORE DATABASE bd_name FROM DISK = "/var/opt/mssql/backup/bdname.bak" WITH MOVE "bd_name" TO "/var/opt/mssql/data/bd_name.mdf", MOVE "bd_name_log" TO "/var/opt/mssql/data/bd_name_log.ldf"'
