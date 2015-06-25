# se usa la variable $(DESTDIR) para seguir el estandar requerido para el empaquetamiento
DESTDIR:=.
INSTALL_PROGRAM:= install -d
INSTALL_EXE:= install -T -m 755

build: build-arch

build-arch:
	$(MAKE) -C src/ CWPROOT=$(shell pwd) install   #----  to install the cwp, plot, and su packages
	$(MAKE) -C src/ CWPROOT=$(shell pwd) xtinstall #----  to install the X windows codes
	
	#nonessential
	#$(MAKE) -C src/ CWPROOT=$(shell pwd) finstall #----- (to install the Fortran codes)
	$(MAKE) -C src/ CWPROOT=$(shell pwd) mglinstall #----- (to install the Mesa/ Open GL items)
	$(MAKE) -C src/ CWPROOT=$(shell pwd) utils   #-----  (to install libcwputils) (nonessential) 
	
.PHONY: build-arch

install:
	# Se crea la carpeta donde estará el script
	#$(INSTALL_PROGRAM) $(DESTDIR)/usr/bin 
	#cp -r ./bin/* $(DESTDIR)/usr/bin/

.PHONY:install

clean: clean-build-arch
	rm -rf ./include || true
	rm -rf ./lib || true
	
.PHONY:clean

clean-build-arch:
	rm -rf ./bin || true
	rm -rf $(DESTDIR)/usr || true
	rm -rf ./usr || true
	
.PHONY:clean-build

shell:
	@(export )
.PHONY:shell

