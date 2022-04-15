#!/bin/bash

KCL="amd/amdkcl"
INC="include"
SRC="amd/dkms"

KERNELVER=$1
KERNELVER_BASE=${KERNELVER%%-*}

version_lt () {
    newest=$((echo "$KERNELVER_BASE"; echo "$1") | sort -V | tail -n1)
    [ "$KERNELVER_BASE" != "$newest" ]
}

version_ge () {
    newest=$((echo "$KERNELVER_BASE"; echo "$1") | sort -V | tail -n1)
    [ "$KERNELVER_BASE" = "$newest" ]
}

version_gt () {
    oldest=$((echo "$KERNELVER_BASE"; echo "$1") | sort -V | head -n1)
    [ "$KERNELVER_BASE" != "$oldest" ]
}

version_le () {
    oldest=$((echo "$KERNELVER_BASE"; echo "$1") | sort -V | head -n1)
    [ "$KERNELVER_BASE" = "$oldest" ]
}

source $KCL/symbols
source $KCL/files

# lookup symbol address. obsolete.
echo '// auto generated by DKMS pre-build.sh' > $KCL/symbols.c
for sym in $SYMS; do
	awk -v sym=$sym '$3 == sym {
		print "void *_kcl_" $3 " = (void *)0x" $1 ";"
	}' /boot/System.map-$KERNELVER >>$KCL/symbols.c
done

sed -i -e '/DEFINE_WD_CLASS(reservation_ww_class)/,/EXPORT_SYMBOL(reservation_ww_class)/d' \
       -e '/dma_resv_lockdep/,/subsys_initcall/d' $KCL/dma-buf/dma-resv.c
sed -i -e '/extern struct ww_class reservation_ww_class/i #include <kcl/kcl_dma-resv.h>' \
       -e '/struct dma_resv {/, /}/d' $INC/linux/dma-resv.h

# add amd prefix to exported symbols
for file in $FILES; do
	awk -F'[()]' '/EXPORT_SYMBOL/ {
		print "#define "$2" amd"$2" //"$0
	}' $file | sort -u >>$INC/rename_symbol.h
done

# rename CONFIG_xxx to CONFIG_xxx_AMDKCL
# otherwise kernel config would override dkms package config
AMDGPU_CONFIG=$(find -name Kconfig -exec grep -h '^config' {} + | sed 's/ /_/' | tr 'a-z' 'A-Z')
TTM_CONFIG=$(awk '/CONFIG_DRM/{gsub(".*\\(CONFIG_DRM","CONFIG_DRM");gsub("\\).*","");print $0}' ttm/Makefile)
SCHED_CONFIG=$(awk '/CONFIG_DRM/{gsub(".*\\(CONFIG_DRM","CONFIG_DRM");gsub("\\).*","");print $0}' scheduler/Makefile)
for config in $AMDGPU_CONFIG $TTM_CONFIG $SCHED_CONFIG; do
	for file in $(grep -rl $config ./); do
		sed -i "s/\<$config\>/&_AMDKCL/" $file
	done
	sed -i "/${config}$/s/$/_AMDKCL/" amd/dkms/Makefile
done

export KERNELVER
(cd $SRC && ./configure)

# rename CFLAGS_<path>target.o to CFLAGS_target.o
if ! grep -q 'define HAVE_AMDKCL_FLAGS_TAKE_PATH' $SRC/config/config.h; then
	for file in $(grep -rl 'CFLAGS_' amd/display/); do
		sed -i 's|$(AMDDALPATH)/.*/\(.*\.o\)|\1|' $file
	done
fi