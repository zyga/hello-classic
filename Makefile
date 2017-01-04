.PHONY: all
all: hello-classic

.PHONY: clean
clean:
	rm -f hello-classic

.PHONY: install
install: hello-classic
	install -d $(DESTDIR)/usr/bin
	install -m 0755 $^ $(DESTDIR)/usr/bin/

hello-classic: hello-classic.c
