-include local.mk

GAME_ROOT?=	../..
FTL_FILES=	$(shell find source -name *.ftl)
FTL_SCRIPTS=	$(wildcard source/*-bg2.ftl)
BS_SCRIPTS=	$(patsubst source/%, build/%, $(patsubst %.ftl, %.bs, $(FTL_SCRIPTS)))

fmpp=		tools/fmpp/bin/fmpp

.SUFFIXES: .ftl .bs .baf
.PRECIOUS: .bs .baf

all: $(BS_SCRIPTS)

build/%.baf: source/%.ftl $(FTL_FILES) $(fmpp)
	@mkdir -p -v build
	$(fmpp) $< -o $@
	@sed -i '/^$$/N;/\n$$/D' "$@"

build/%-bg2.bs: build/%-bg2.baf
	./compile.sh bg2 $< $@

install: $(BS_SCRIPTS)
	@cp -v $+ $(GAME_ROOT)/scripts

clean:
	@rm -rfv build

debug:
	@echo "GAME_ROOT = $(GAME_ROOT)"
	@echo "FTL_ROOT = $(FTL_ROOT)"
	@echo "FTL_SCRIPTS = $(FTL_SCRIPTS)"
	@echo "FTL_FILES = $(FTL_FILES)"
	@echo "BS_SCRIPTS = $(BS_SCRIPTS)"

#TODO install cygwin packages automatically
#TODO install fmpp automatically
