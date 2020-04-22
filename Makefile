VERSION        = 1.6-apathy

CC             = x86_64-apathy-linux-musl-gcc 
CPPFLAGS       = -DVERSION=\"$(VERSION)\"
LDFLAGS        = -s
CFLAGS         = -std=gnu99 -fstack-protector-all -march=native -mtune=native \
                 -O2 -Wall -Wextra -Wformat-security -Wconversion

SRCS           = ./src/globals.c ./src/kill.c ./src/main.c ./src/meminfo.c ./src/msg.c
OBJS           = ./src/globals.o ./src/kill.o ./src/main.o ./src/meminfo.o ./src/msg.o

%.o: %.c
	$(CC) -c -o $@ $< $(CPPFLAGS) $(LDFLAGS) $(CFLAGS)

earlyoom: $(OBJS)
	$(CC) -o $@ $^ $(CPPFLAGS) $(LDFLAGS) $(CFLAGS)

clean:
	rm -f earlyoom
