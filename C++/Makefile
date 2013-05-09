NAME = mainexec
SRC = main.cpp
OBJ = ${SRC:.cpp=.o}
DEPEND = ${SRC:.cpp=.d} 

CXXFLAGS = -g -std=c++11 -DDEBUG -Wall -Werror

all: ${NAME}

${NAME}: ${OBJ}
	${CXX} -o $@ $^ ${LDFLAGS}

%.d: %.cpp
	@set -e; rm -f $@
	${CXX} -MM ${CXXFLAGS} ${CPPFLAGS} $< | sed 's/\(^.*\)\.o[ :]*/\1.o $@ : /g' > $@

include ${DEPEND}

clean:
	rm -f ${NAME} ${OBJ} ${DEPEND}

.PHONY: clean
