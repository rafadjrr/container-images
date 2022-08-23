FROM registry.redhat.io/ubi8/python-36
EXPOSE 8080
USER root
RUN curl https://packages.microsoft.com/config/rhel/8/prod.repo > /etc/yum.repos.d/mssql-release.repo
RUN yum remove unixODBC-utf16 unixODBC-utf16-devel #to avoid conflicts
RUN ACCEPT_EULA=Y yum install -y msodbcsql17
RUN ACCEPT_EULA=Y yum install -y mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN source ~/.bashrc
RUN yum install -y unixODBC-devel
RUN yum install -y vim
WORKDIR /usr/src/app
COPY . .
RUN pip install gunicorn
RUN pip install --no-cache-dir -r requeriments.txt
CMD ["python","manage.py","runserver","0:8080"]
ENV "OPENSHIFT_BUILD_NAME"="pyodbc-27" "OPENSHIFT_BUILD_NAMESPACE"="default" "OPENSHIFT_BUILD_SOURCE"="https://github.com/rafadjrr/ApiRest-Django" "OPENSHIFT_BUILD_REFERENCE"="testdocker" "OPENSHIFT_BUILD_COMMIT"="27cae80356cd058567b6a2a029e000956873d11b"
LABEL "io.openshift.build.commit.author"="rafadjrr \u003c46068766+rafadjrr@users.noreply.github.com\u003e" "io.openshift.build.commit.date"="Tue Jun 14 16:58:32 2022 -0400" "io.openshift.build.commit.id"="27cae80356cd058567b6a2a029e000956873d11b" "io.openshift.build.commit.message"="revert commit rhel 8" "io.openshift.build.commit.ref"="testdocker" "io.openshift.build.name"="pyodbc-27" "io.openshift.build.namespace"="default" "io.openshift.build.source-context-dir"="/" "io.openshift.build.source-location"="https://github.com/rafadjrr/ApiRest-Django"
ENV "OPENSHIFT_BUILD_NAME"="industrial-api-1" "OPENSHIFT_BUILD_NAMESPACE"="escawo" "OPENSHIFT_BUILD_SOURCE"="https://gitlab.com/sistemaspolybarq/industrial.git" "OPENSHIFT_BUILD_REFERENCE"="develop" "OPENSHIFT_BUILD_COMMIT"="4868e948884e973478cc51194318672858078dc6"
LABEL "io.openshift.build.commit.author"="Rafael \u003crafadjrr@gmail.com\u003e" "io.openshift.build.commit.date"="Wed Jun 15 13:46:56 2022 -0400" "io.openshift.build.commit.id"="4868e948884e973478cc51194318672858078dc6" "io.openshift.build.commit.message"="base backend" "io.openshift.build.commit.ref"="develop" "io.openshift.build.name"="industrial-api-1" "io.openshift.build.namespace"="escawo" "io.openshift.build.source-context-dir"="/"
ENV "OPENSHIFT_BUILD_NAME"="industrial-api-3" "OPENSHIFT_BUILD_NAMESPACE"="escawo" "OPENSHIFT_BUILD_SOURCE"="https://gitlab.com/sistemaspolybarq/industrial.git" "OPENSHIFT_BUILD_REFERENCE"="develop" "OPENSHIFT_BUILD_COMMIT"="e09a6877e49d4f4357035e955b56c240d6ebf973"
LABEL "io.openshift.build.commit.author"="rafadjrr \u003crafadjrr@gmail.com\u003e" "io.openshift.build.commit.date"="Thu Jun 16 15:11:00 2022 +0000" "io.openshift.build.commit.id"="e09a6877e49d4f4357035e955b56c240d6ebf973" "io.openshift.build.commit.message"="update settings.py" "io.openshift.build.commit.ref"="develop" "io.openshift.build.name"="industrial-api-3" "io.openshift.build.namespace"="escawo" "io.openshift.build.source-context-dir"="/"
ENV "OPENSHIFT_BUILD_NAME"="industrial-api-6" "OPENSHIFT_BUILD_NAMESPACE"="escawo" "OPENSHIFT_BUILD_SOURCE"="https://gitlab.com/sistemaspolybarq/industrial.git" "OPENSHIFT_BUILD_REFERENCE"="develop" "OPENSHIFT_BUILD_COMMIT"="47860db06e9cb3f32225acdcf3a52b95324187ca"
LABEL "io.openshift.build.commit.author"="Rafael \u003crafadjrr@gmail.com\u003e" "io.openshift.build.commit.date"="Mon Jun 20 14:42:26 2022 -0400" "io.openshift.build.commit.id"="47860db06e9cb3f32225acdcf3a52b95324187ca" "io.openshift.build.commit.message"="clear cache" "io.openshift.build.commit.ref"="develop" "io.openshift.build.name"="industrial-api-6" "io.openshift.build.namespace"="escawo" "io.openshift.build.source-context-dir"="/"
ENV "OPENSHIFT_BUILD_NAME"="industrial-api-11" "OPENSHIFT_BUILD_NAMESPACE"="escawo" "OPENSHIFT_BUILD_SOURCE"="https://gitlab.com/sistemaspolybarq/industrial.git" "OPENSHIFT_BUILD_REFERENCE"="develop" "OPENSHIFT_BUILD_COMMIT"="525f9399373a18a02c4ac7de8b17c03cda4bbba5"
LABEL "io.openshift.build.commit.author"="rafadjrr \u003crafadjrr@gmail.com\u003e" "io.openshift.build.commit.date"="Tue Jun 21 15:25:33 2022 +0000" "io.openshift.build.commit.id"="525f9399373a18a02c4ac7de8b17c03cda4bbba5" "io.openshift.build.commit.message"="update model, campo id para materia prima no debe ser autoincrement" "io.openshift.build.commit.ref"="develop" "io.openshift.build.name"="industrial-api-11" "io.openshift.build.namespace"="escawo" "io.openshift.build.source-context-dir"="/"
ENV "OPENSHIFT_BUILD_NAME"="industrial-api-12" "OPENSHIFT_BUILD_NAMESPACE"="escawo" "OPENSHIFT_BUILD_SOURCE"="https://gitlab.com/sistemaspolybarq/industrial.git" "OPENSHIFT_BUILD_REFERENCE"="develop" "OPENSHIFT_BUILD_COMMIT"="d9f8170be19cbd31987c4add64dc17c4e0daaad2"
LABEL "io.openshift.build.commit.author"="rafadjrr \u003crafadjrr@gmail.com\u003e" "io.openshift.build.commit.date"="Tue Jun 21 20:52:29 2022 +0000" "io.openshift.build.commit.id"="d9f8170be19cbd31987c4add64dc17c4e0daaad2" "io.openshift.build.commit.message"="prueba decorador y readonly library instalada" "io.openshift.build.commit.ref"="develop" "io.openshift.build.name"="industrial-api-12" "io.openshift.build.namespace"="escawo" "io.openshift.build.source-context-dir"="/"
ENV "OPENSHIFT_BUILD_NAME"="industrial-api-15" "OPENSHIFT_BUILD_NAMESPACE"="escawo" "OPENSHIFT_BUILD_SOURCE"="https://gitlab.com/sistemaspolybarq/industrial.git" "OPENSHIFT_BUILD_REFERENCE"="develop" "OPENSHIFT_BUILD_COMMIT"="efa57195572d1c85eba439b589e7d8441586433a"
LABEL "io.openshift.build.commit.author"="Rafael \u003crafadjrr@gmail.com\u003e" "io.openshift.build.commit.date"="Thu Jul 7 12:09:43 2022 -0400" "io.openshift.build.commit.id"="efa57195572d1c85eba439b589e7d8441586433a" "io.openshift.build.commit.message"="new rest multimoneda, tasas" "io.openshift.build.commit.ref"="develop" "io.openshift.build.name"="industrial-api-15" "io.openshift.build.namespace"="escawo" "io.openshift.build.source-context-dir"="/"
ENV "OPENSHIFT_BUILD_NAME"="industrial-api-16" "OPENSHIFT_BUILD_NAMESPACE"="escawo" "OPENSHIFT_BUILD_SOURCE"="https://gitlab.com/sistemaspolybarq/industrial.git" "OPENSHIFT_BUILD_REFERENCE"="develop" "OPENSHIFT_BUILD_COMMIT"="e05ed9e4ff6c449b1b6457d2e3f18a999b0a5983"
LABEL "io.openshift.build.commit.author"="rafa \u003crafadjrr@gmail.com\u003e" "io.openshift.build.commit.date"="Fri Jul 8 14:54:54 2022 +0000" "io.openshift.build.commit.id"="e05ed9e4ff6c449b1b6457d2e3f18a999b0a5983" "io.openshift.build.commit.message"="rest updates" "io.openshift.build.commit.ref"="develop" "io.openshift.build.name"="industrial-api-16" "io.openshift.build.namespace"="escawo" "io.openshift.build.source-context-dir"="/"