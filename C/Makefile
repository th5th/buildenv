include config.mk

OBJ = $(SRC:%.c=%.o)
DEPEND = $(SRC:%.c=%.d)

CFLAGS += -DNAME=\"$(NAME)\" -DVERSION=\"$(VERSION)\"

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

-include $(DEPEND)

%.d: %.c
	$(CC) -MM $(CFLAGS) $(CPPFLAGS) $< > $@

clean:
	rm -f $(NAME) $(OBJ) $(DEPEND)

.PHONY: clean
