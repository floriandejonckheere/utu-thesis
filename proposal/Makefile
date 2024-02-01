SOURCES   := proposal.typ
DOCUMENTS := $(patsubst %.typ,%.pdf,$(SOURCES))

all: tidy $(DOCUMENTS)

.PHONY:

%.pdf: %.typ
	typst compile $<

tidy:
	typstfmt $(SOURCES)

words:
	for FILE in *.pdf; do echo "$${FILE}: `ps2ascii $${FILE} | wc -w` words"; done