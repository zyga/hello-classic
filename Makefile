.PHONY: all
all: hello-classic_0.1_amd64.snap

hello-classic: hello-classic.c

hello-classic_0.1_amd64.snap: hello-classic
	mksquashfs . $@ -e $@ -noappend -no-xattrs -comp xz

.PHONY: clean
clean:
	rm -f hello-classic
	rm -f *.snap

arch := $(shell $(CC) -dumpmachine)
SNAP_CORE=core

# Don't search in default locations
LDFLAGS += -Wl,-z,nodefaultlib
LDFLAGS += -Wl,--enable-new-dtags
# Search in the core snap
LDFLAGS += -Wl,-rpath,/snap/$(SNAP_CORE)/current/lib/$(arch):/snap/$(SNAP_CORE)/current/usr/lib/$(arch)
# Use the dynamic linker from the core snap
LDFLAGS += -Wl,--dynamic-linker=/snap/$(SNAP_CORE)/current/lib/$(arch)/ld-linux-x86-64.so.2
