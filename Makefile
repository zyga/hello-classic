.PHONY: all
all: hello-classic

hello-classic: hello-classic.c

.PHONY: clean
clean:
	rm -f hello-classic

arch := $(shell $(CC) -dumpmachine)
SNAP_CORE=core

# Don't search in default locations
LDFLAGS += -Wl,-z,nodefaultlib
LDFLAGS += -Wl,--enable-new-dtags
# Search in the core snap
LDFLAGS += -Wl,-rpath,/snap/$(SNAP_CORE)/current/lib/$(arch):/snap/$(SNAP_CORE)/current/usr/lib/$(arch)
# Use the dynamic linker from the core snap
LDFLAGS += -Wl,--dynamic-linker=/snap/$(SNAP_CORE)/current/lib/$(arch)/ld-linux-x86-64.so.2
