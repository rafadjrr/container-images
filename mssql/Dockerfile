# https://hub.docker.com/_/microsoft-mssql-server
FROM mcr.microsoft.com/mssql/server:2019-CU1-ubuntu-16.04

# Vatiables de entorno para Contraseña de mssql y Aceptar licencia
# Tal como se especifica en la documentacion de la imagen base 
# https://hub.docker.com/_/microsoft-mssql-server
ENV SA_PASSWORD=123456Ps ACCEPT_EULA=Y MSSQL_PID=Express
USER root
# Copiar backup File y entrypoint para el contenedor
#COPY ./data-mssql.sh /
#COPY ./entrypoint.sh /

# Otorgar permisos del archivo
# RUN chmod +x /data-mssql.sh

# Configurar el punto de entrada para el contenedor
#CMD /bin/bash /entrypoint.sh