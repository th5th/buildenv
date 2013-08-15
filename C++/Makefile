include config.mk

OBJ = $(SRC:.cpp=.o)
DEPEND = $(SRC:.cpp=.d) 

CXXFLAGS += -DNAME=\"$(NAME)\" -DVERSION=\"$(VERSION)\"

all: $(NAME)

$(NAME): $(OBJ)
	$(CXX) -o $@ $^ $(LDFLAGS)

-include $(DEPEND)

%.d: %.cpp
	$(CXX) -MM $(CXXFLAGS) $(CPPFLAGS) $<  > $@

clean:
	rm -f $(NAME) $(OBJ) $(DEPEND)

.PHONY: clean
