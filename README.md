#Empaquetamiento Seismic Unix por SciDeb

Nos reducirán algunas líneas de código en el proceso de de empaquetamiento
```
$ DEBFULLNAME="nombre completo"
$ DEBEMAIL=correo electronico
$ export DEBFULLNAME DEBEMAIL
```
Para empaquetar el siguiente programa instalar:
```
# apt-get install lintian dh-make devscripts debhelper build-essential scons dh-exec
```
Para poder construir el los binarios desdes las fuentes es necesario instalar:
```
# apt-get install libmotif-dev libxmu-dev libxi-dev gfortran libxt-dev libx11-dev x11proto-print-dev libxt6 libmotif4 freeglut3-dev
```
Desde la carpeta seismic-unix/seismic-unix/ ejecutar el siguiente comando:
```
$ debuild -r'fakeroot' -i -us -uc
```