include config.mk

LIB = lib$(NAME).so
STATIC = lib$(NAME).a
TEST= $(NAME)-test

PYSO=_$(PYMOD).so
PYFILES=$(PYMOD).py $(PYMOD).pyc 
SWIGWRAP=$(PUBHEADER:.h=_wrap.c)
SWIGOBJ=$(SWIGWRAP:.c=.o)
LIBOBJ = $(LIBSRC:.c=.o)
TESTOBJ = $(TESTSRC:.c=.o)
DEPEND = $(LIBSRC:.c=.d) $(TESTSRC:.c=.d) 

CFLAGS += -DNAME=\"$(NAME)\" -DVERSION=\"$(VERSION)\"

all: $(LIB) $(STATIC) $(TEST)
so: $(LIB)
static: $(STATIC)
swig: $(PYSO)
test: $(TEST)

$(LIB): $(LIBOBJ)
	$(CC) $(CFLAGS) -shared -o $@ -Wl,-soname,$@ $(LDFLAGS) $^

$(STATIC): $(LIBOBJ)
	ar rcs $@ $^

$(TEST): $(TESTOBJ) $(STATIC)
	$(CC) $(CFLAGS) -static $(TESTOBJ) -L. -l$(NAME) -o $@ 

$(PYSO): $(LIBOBJ)
	swig -python -module $(PYMOD) $(PUBHEADER)
	$(CC) $(CFLAGS) -c $(SWIGWRAP) -I/usr/include/python$(PYVERSION)
	$(CC) $(CFLAGS) -shared -o $(PYSO) $(SWIGOBJ) $(LIBOBJ) 

%.d: %.c
	@set -e; rm -f $@
	$(CC) -MM $(CFLAGS) $< | sed 's/\(^.*\)\.o[ :]*/\1.o $@ : /g' > $@

include $(DEPEND)

clean:
	rm -rf $(LIB) $(STATIC) $(TEST) $(LIBOBJ) $(TESTOBJ) $(DEPEND) $(PYSO) $(PYFILES) $(SWIGWRAP) $(SWIGOBJ) __pycache__

.PHONY: clean
