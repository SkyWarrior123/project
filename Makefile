CC     = gcc

SOURCEDIR  = sources
BUILDDIR   = build
BUILDTYPE  = Debug
LEGCFLAGS  = # Lost, must be found
LEGLDFLAGS = # Lost, must be found

CFLAGS  := $(LEGCFLAGS) -Wextra -Wall -Isources/functions $(CFLAGS)
ifeq ($(BUILDTYPE),Debug)
CFLAGS  := -ggdb -O0 $(CFLAGS)
endif

LDFLAGS := $(LEGLDFLAGS) $(LDFLAGS) 

SOURCES = $(SOURCEDIR)/main.c      \
          $(SOURCEDIR)/functions/functions.c
OBJECTS = $(subst $(SOURCEDIR),$(BUILDDIR),$(subst .c,.o,$(SOURCES)))

all: $(BUILDDIR)/door-locker.out

$(BUILDDIR)/door-locker.out: $(OBJECTS) | $(BUILDDIR)
	$(CC) -o $@ $^ $(LDFLAGS)
ifeq ($(BUILDTYPE),Release)
	strip $@
endif

$(BUILDDIR)/%.o: $(SOURCEDIR)/%.c
	[ -d $(@D) ] || mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILDDIR):
	@-mkdir -vp $@

.PHONY: clean clear
clean:
	@$(RM) -rv $(OBJECTS)
clear: clean
	@$(RM) -rv $(BUILDDIR)
	
