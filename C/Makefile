NAME = mainexec
SRC = main.c
OBJ = ${SRC:.c=.o}
DEPEND = ${SRC:.c=.d} 

CFLAGS = -g -std=c99 -DDEBUG -Wall -Werror

all: ${NAME}

${NAME}: ${OBJ}
	${CC} -o $@ $^ ${LDFLAGS}

%.d: %.c
	@set -e; rm -f $@
	${CC} -MM ${CFLAGS} ${CPPFLAGS} $< | sed 's/\(^.*\)\.o[ :]*/\1.o $@ : /g' > $@

include ${DEPEND}

clean:
	rm -f ${NAME} ${OBJ} ${DEPEND}

.PHONY: clean
