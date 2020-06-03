CC       = cc 
CPPFLAGS = -DVERSION=\"1.6-apathy\"
CFLAGS   = -std=gnu99 -fstack-protector-all -Os -Wall -Wextra \
           -Wformat-security -Wconversion
LDFLAGS  = -s

SRC      = $(wildcard *.c)
OBJ      = ${SRC:.c=.o}

all: earlyoom

.c.o:
	${CC} -c ${CFLAGS} ${CPPFLAGS} $<

earlyoom: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm     -f earlyoom ${OBJ}

install: all
	mkdir  -p           ${DESTDIR}/sbin
	cp     -f  earlyoom ${DESTDIR}/sbin
	chmod  755          ${DESTDIR}/sbin/earlyoom

.PHONY: all clean install
