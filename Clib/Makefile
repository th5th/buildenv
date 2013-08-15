include config.mk

LIB = lib$(NAME).so
STATIC = lib$(NAME).a
TEST = $(NAME)-test

LIBOBJ = $(LIBSRC:.c=.o)
TESTOBJ = $(TESTSRC:.c=.o)
DEPEND = $(LIBSRC:.c=.d) $(TESTSRC:.c=.d) 

CFLAGS += -DNAME=\"$(NAME)\" -DVERSION=\"$(VERSION)\"

all: $(LIB) $(STATIC) $(TEST)
so: $(LIB)
static: $(STATIC)
test: $(TEST)

$(LIB): $(LIBOBJ)
	$(CC) $(CFLAGS) -shared -o $@ -Wl,-soname,$@ $^ $(LDFLAGS) 

$(STATIC): $(LIBOBJ)
	ar rcs $@ $^

$(TEST): $(TESTOBJ) $(STATIC)
	$(CC) $(CFLAGS) -o $@ $(TESTOBJ) $(STATIC) $(LDFLAGS) 

-include $(DEPEND)

%.d: %.c
	$(CC) -MM $(CFLAGS) $< > $@

clean:
	rm -f $(LIB) $(STATIC) $(TEST) $(LIBOBJ) $(TESTOBJ) $(DEPEND)

.PHONY: clean
