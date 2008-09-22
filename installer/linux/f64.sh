#!/bin/sh

DIR=linux_f64

mkdir -p -m 0755 ../../../CSDIST/$DIR/bin
mkdir -p -m 0755 ../../../CSDIST/$DIR/doc
mkdir -p -m 0755 ../../../CSDIST/$DIR/hdr
mkdir -p -m 0755 ../../../CSDIST/$DIR/lib
mkdir -p -m 0755 ../../../CSDIST/$DIR/opc
mkdir -p -m 0755 ../../../CSDIST/$DIR/opc/frontends
mkdir -p -m 0755 ../../../CSDIST/$DIR/loc

rm ../../../CSDIST/$DIR/bin/*

cp -pv ../../{linseg,lpanal,brkpt,lpc_export,lpc_import,cs,makecsd,csb64enc,cscore,csound,csound5gui,cvanal,dnoise,mixer,envext,extract,extractor,pvanal,pvlook,het_export,het_import,hetro,scale,scot,scsort,sdif2ad,srconv,tabdes,winsound,cstclsh,cswish,matrix.tk,pv_export,pv_import,atsa,sndinfo,cseditor} ../../../CSDIST/$DIR/bin

strip ../../../CSDIST/$DIR/bin/*

rm ../../../CSDIST/$DIR/opc/*
rm ../../../CSDIST/$DIR/opc/frontends/*
cp -puv ../../li*.so ../../opcodes.dir ../../../CSDIST/$DIR/opc

mv ../../../CSDIST/$DIR/opc/lib_csnd.so ../../../CSDIST/$DIR/opc/frontends
mv ../../../CSDIST/$DIR/opc/lib_jcsound.so ../../../CSDIST/$DIR/opc/frontends
cp -puv ../../_loris.so ../../../CSDIST/$DIR/opc/frontends
ln ../../../CSDIST/$DIR/opc/frontends/lib_csnd.so ../../../CSDIST/$DIR/opc/frontends/_csnd.so
cp -puv ../../*.jar ../../../CSDIST/$DIR/opc/frontends
cp -puv ../../csnd.py ../../../CSDIST/$DIR/opc/frontends
cp -puv ../../loris.py ../../../CSDIST/$DIR/opc/frontends
rm ../../../CSDIST/$DIR/opc/libcsound.so
rm ../../../CSDIST/$DIR/opc/lib_CsoundVST.so

cp -upv ../../libcsound.so.5.1  ../../../CSDIST/$DIR/lib
(cd  ../../../CSDIST/$DIR/lib; ln -s libcsound.so.5.1 libcsound.so)

cp -upv ../../libcsound.a  ../../../CSDIST/$DIR/lib

cp -upv ../../H/cfgvar.h ../../H/cscore.h ../../H/csdl.h ../../H/csound.h ../../H/csound.hpp ../../H/csoundCore.h ../../H/cwindow.h ../../H/msg_attr.h ../../H/OpcodeBase.hpp ../../H/pstream.h ../../H/pvfileio.h ../../H/soundio.h ../../H/sysdep.h ../../H/text.h ../../H/version.h ../../interfaces/CsoundFile.hpp ../../interfaces/CppSound.hpp ../../interfaces/filebuilding.h ../../../CSDIST/$DIR/hdr

cp -rupv ../../../manual/html ../../../CSDIST/$DIR/doc
find ../../../CSDIST/$DIR/ -name CVS -exec rm -rf {} \;

###en_GB/  es_CO/    fr/  it/ ro/  de/   en_US/ /ru /ro
cp -upv ../../po/de/LC_MESSAGES/csound5.mo ../../../CSDIST/$DIR/loc/de_csound5.mo
cp -upv ../../po/en_GB/LC_MESSAGES/csound5.mo ../../../CSDIST/$DIR/loc/en_csound5.mo
cp -upv ../../po/en_US/LC_MESSAGES/csound5.mo ../../../CSDIST/$DIR/loc/us_csound5.mo
cp -upv ../../po/es_CO/LC_MESSAGES/csound5.mo ../../../CSDIST/$DIR/loc/es_csound5.mo
cp -upv ../../po/fr/LC_MESSAGES/csound5.mo ../../../CSDIST/$DIR/loc/fr_csound5.mo
cp -upv ../../po/it/LC_MESSAGES/csound5.mo ../../../CSDIST/$DIR/loc/it_csound5.mo
cp -upv ../../po/ro/LC_MESSAGES/csound5.mo ../../../CSDIST/$DIR/loc/ro_csound5.mo
cp -upv ../../po/ru/LC_MESSAGES/csound5.mo ../../../CSDIST/$DIR/loc/ru_csound5.mo

cp -upv installer ../../../CSDIST/$DIR
cat > ../../../CSDIST/$DIR/def.ins <<'EOF'
Linux i86_64 Floats
/usr/local/bin
/usr/local/include
/usr/local/csound_64
/usr/local/doc/csound
/usr/local/lib64
/usr/local/share/locale
OPCODEDIR
libcsound.a
'EOF'
