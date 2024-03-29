########### MAKEFILE FOR THE ADVENTURE ENGINE ###########
export progroot ?= $(CURDIR)
export srcroot ?= $(progroot)
#########################################################
# While I don't like gcc as much as clang, I realize that 
# gcc is more prevalent these days
#########################################################
CC = gcc 
OUTPUT = moo.prog
SUBDIRS = System
#the user defines this
ifndef BACKEND_SPECIFIC
export BACKEND_GENERIC := 1
endif 
OBJS = System/Core/agenda.o System/Core/analysis.o System/Core/argacces.o System/Core/bload.o System/Core/bmathfun.o System/Core/bsave.o \
 	System/Core/classcom.o System/Core/classexm.o System/Core/classfun.o System/Core/classinf.o System/Core/classini.o \
	System/Core/classpsr.o System/Core/clsltpsr.o System/Core/commline.o System/Core/conscomp.o System/Core/constrct.o \
 	System/Core/constrnt.o System/Core/crstrtgy.o System/Core/cstrcbin.o System/Core/cstrccom.o System/Core/cstrcpsr.o \
 	System/Core/cstrnbin.o System/Core/cstrnchk.o System/Core/cstrncmp.o System/Core/cstrnops.o System/Core/cstrnpsr.o \
 	System/Core/cstrnutl.o System/Core/default.o System/Core/defins.o System/Core/developr.o System/Core/dffctbin.o System/Core/dffctbsc.o \
 	System/Core/dffctcmp.o System/Core/dffctdef.o System/Core/dffctpsr.o System/Core/dffnxbin.o System/Core/dffnxcmp.o \
	System/Core/dffnxexe.o System/Core/dffnxfun.o System/Core/dffnxpsr.o System/Core/dfinsbin.o System/Core/dfinscmp.o System/Core/drive.o \
	System/Core/emathfun.o \
 	System/Core/engine.o System/Core/envrnmnt.o System/Core/evaluatn.o System/Core/expressn.o System/Core/exprnbin.o System/Core/exprnops.o \
 	System/Core/exprnpsr.o System/Core/extnfunc.o System/Core/factbin.o System/Core/factbld.o System/Core/factcmp.o System/Core/factcom.o \
 	System/Core/factfun.o System/Core/factgen.o System/Core/facthsh.o System/Core/factlhs.o System/Core/factmch.o System/Core/factmngr.o \
 	System/Core/factprt.o System/Core/factqpsr.o System/Core/factqury.o System/Core/factrete.o System/Core/factrhs.o System/Core/filecom.o \
 	System/Core/filertr.o System/Core/generate.o System/Core/genrcbin.o System/Core/genrccmp.o System/Core/genrccom.o System/Core/genrcexe.o \
 	System/Core/genrcfun.o System/Core/genrcpsr.o System/Core/globlbin.o System/Core/globlbsc.o System/Core/globlcmp.o System/Core/globlcom.o \
 	System/Core/globldef.o System/Core/globlpsr.o System/Core/immthpsr.o System/Core/incrrset.o System/Core/inherpsr.o \
 	System/Core/inscom.o System/Core/insfile.o System/Core/insfun.o System/Core/insmngr.o System/Core/insmoddp.o System/Core/insmult.o \
 	System/Core/inspsr.o System/Core/insquery.o System/Core/insqypsr.o System/Core/iofun.o System/Core/lgcldpnd.o \
 	System/Core/memalloc.o System/Core/miscfun.o System/Core/modulbin.o System/Core/modulbsc.o System/Core/modulcmp.o System/Core/moduldef.o \
 	System/Core/modulpsr.o System/Core/modulutl.o System/Core/msgcom.o System/Core/msgfun.o System/Core/msgpass.o System/Core/msgpsr.o \
 	System/Core/multifld.o System/Core/multifun.o System/Core/objbin.o System/Core/objcmp.o System/Core/objrtbin.o System/Core/objrtbld.o \
 	System/Core/objrtcmp.o System/Core/objrtfnx.o System/Core/objrtgen.o System/Core/objrtmch.o System/Core/parsefun.o System/Core/pattern.o \
 	System/Core/pprint.o System/Core/prccode.o System/Core/prcdrfun.o System/Core/prcdrpsr.o System/Core/prdctfun.o System/Core/prntutil.o \
 	System/Core/proflfun.o System/Core/reorder.o System/Core/reteutil.o System/Core/retract.o System/Core/router.o System/Core/rulebin.o \
 	System/Core/rulebld.o System/Core/rulebsc.o System/Core/rulecmp.o System/Core/rulecom.o System/Core/rulecstr.o System/Core/ruledef.o \
 	System/Core/ruledlt.o System/Core/rulelhs.o System/Core/rulepsr.o System/Core/scanner.o System/Core/sortfun.o System/Core/strngfun.o \
 	System/Core/strngrtr.o System/Core/symblbin.o System/Core/symblcmp.o System/Core/symbol.o System/Core/sysdep.o System/Core/textpro.o \
 	System/Core/tmpltbin.o System/Core/tmpltbsc.o System/Core/tmpltcmp.o System/Core/tmpltdef.o System/Core/tmpltfun.o System/Core/tmpltlhs.o \
 	System/Core/tmpltpsr.o System/Core/tmpltrhs.o System/Core/tmpltutl.o System/Core/userdata.o System/Core/userfunctions.o \
 	System/Core/utility.o System/Core/watch.o System/Core/main.o System/Core/binary_operations.o System/Platform/ArchitectureDetection.o \
	System/Platform/OSDetection.o System/Platform/HardwareDetection.o System/Platform/Platform.o \
	System/Initialization/AdventureEngineInit.o System/System.o System/Input/Input.o \
	System/Input/MouseInput.o System/Input/KeyboardInput.o 


ifdef BACKEND_GENERIC 
OBJS += System/Backends/Generic/KeyboardImplementation.o System/Backends/Generic/MouseImplementation.o
export BACKEND_DEFINED := 1
export TARGET_BACKEND := Generic
endif


#ifdef BACKEND_SCUMMVM
#OBJS += System/Backends/Scummvm/
#export BACKEND_DEFINED := 1
#export TARGET_BACKEND ?= Scummvm
#endif

ifdef BACKEND_SPECIFIC
ifndef BACKEND_DEFINED
  $(error Specific backend desired but an invalid backend was provided)
endif
endif

program: subdirs 
	$(CC) $(CFLAGS) -o $(OUTPUT) $(OBJS) -lm -lncurses


.PHONY: clean sub-clean subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

clean: sub-clean
	rm -f $(OUTPUT)

sub-clean:
	for d in $(SUBDIRS); do ($(MAKE) -C $$d clean ); done
