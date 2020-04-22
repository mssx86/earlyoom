VERSION        = 1.6-apathy
LDFLAGS        = -s
CFLAGS         = -std=gnu99 -fstack-protector-all \
                 -march=native -mtune=native -O2  \
                 -Wall -Wextra -Wformat-security  \
                 -Wconversion -DVERSION=\"$(VERSION)\"

PREFIX         = /sbin
BINDIR         = /bin
SYSCONFDIR     = /etc

.PHONY: all clean install

all: earlyoom

earlyoom:
	$(CC) $(LDFLAGS) $(CPPFLAGS) $(CFLAGS) -o earlyoom $(wildcard *.c)

clean:
	rm -f earlyoom

install: earlyoom
	install -d        $(DESTDIR)$(PREFIX)$(BINDIR)/
	install -m 755 $< $(DESTDIR)$(PREFIX)$(BINDIR)/
