CC       ?= x86_64-apathy-linux-musl-gcc
CFLAGS   += -std=gnu99 -DVERSION=\"1.6.1-apathy\"
LDFLAGS  += -s

SRC      = $(wildcard *.c)
OBJ      = ${SRC:.c=.o}

all: earlyoom

.c.o:
	${CC} -c ${CFLAGS} $<

earlyoom: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm     -f earlyoom ${OBJ}

install: all
	mkdir  -p           ${DESTDIR}/sbin
	cp     -f  earlyoom ${DESTDIR}/sbin
	chmod  755          ${DESTDIR}/sbin/earlyoom

.PHONY: all clean install
