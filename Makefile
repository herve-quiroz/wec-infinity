-include local.mk

GAME_ROOT?=	..
FTL_FILES=	$(shell find source -name *.ftl)
FTL_SCRIPTS=	$(wildcard source/*-bg2.ftl) $(wildcard source/*-iwd2.ftl)
BS_SCRIPTS=	$(patsubst source/%, build/%, $(patsubst %.ftl, %.bs, $(FTL_SCRIPTS)))

.SUFFIXES: .ftl .bs .baf
.PRECIOUS: .bs .baf

all: $(BS_SCRIPTS)

build/%.baf: source/%.ftl $(FTL_FILES) tools/fmpp/bin/fmpp
	@mkdir -p -v build
	tools/fmpp/bin/fmpp $< -o $@
	@sed -i '/^$$/N;/\n$$/D' "$@"

tools/fmpp/bin/fmpp:
	@mkdir -pv build
	@wget -O build/fmpp.zip http://downloads.sourceforge.net/project/fmpp/fmpp/0.9.14/fmpp_0.9.14.zip
	@mkdir -pv "tools"
	@unzip -o -d tools/ build/fmpp.zip
	@mv -v tools/fmpp_* tools/fmpp

build/%-bg2.bs: build/%-bg2.baf aicompile.sh aicompile-bg2
	./aicompile.sh bg2 $< $@

aicompile-bg2: tools/aicompile/bg2/aicompile.exe

tools/aicompile/bg2/aicompile.exe:
	@mkdir -pv "tools/aicompile/bg2"
	@mkdir -pv build
	@cd build && wget http://download.trancecode.org/infinity/bg2/bg2-aicompiler.zip
	@unzip -o -d tools/aicompile/bg2/ build/bg2-aicompiler.zip

build/%-iwd2.bs: build/%-iwd2.baf aicompile.sh aicompile-iwd2
	./aicompile.sh iwd2 $< $@

aicompile-iwd2: tools/aicompile/iwd2/aicompile.exe

tools/aicompile/iwd2/aicompile.exe:
	@mkdir -pv "tools/aicompile/iwd2"
	@mkdir -pv build
	@cd build && wget http://download.trancecode.org/infinity/iwd2/iwd2-aicompiler.zip
	@unzip -o -d tools/aicompile/iwd2/ build/iwd2-aicompiler.zip

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
