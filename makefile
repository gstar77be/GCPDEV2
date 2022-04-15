
BIN_LIB=GCPDEV2
LIBLIST=$(BIN_LIB) GCPDATA9J
SHELL=/QOpenSys/usr/bin/qsh

#all: depts.sqlrpgle employees.sqlrpgle hellovid.sqlrpgle

#depts.sqlrpgle: depts.dspf
#employees.sqlrpgle: emps.dspf

all: DEMO100R.rpgle DEMO120R.rpgle


%.rpgle:
	@echo Let''s create program....
	system -s "CHGATR OBJ('qilesrc/$*.rpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTBNDRPG PGM($(BIN_LIB)/$*) SRCSTMF('qilesrc/$*.rpgle') REPLACE(*YES) OPTION(*EVENTF) DBGVIEW(*SOURCE)"

%.sqlrpgle:
	system -s "CHGATR OBJ('./qilesrc/$*.sqlrpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTSQLRPGI OBJ($(BIN_LIB)/$*) SRCSTMF('./qilesrc/$*.sqlrpgle') COMMIT(*NONE) DBGVIEW(*SOURCE) OPTION(*EVENTF)"

