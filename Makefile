SOURCES := proposal thesis
DOCUMENTS := $(patsubst %,%.pdf,$(SOURCES))

all: $(DOCUMENTS)

.PHONY:

%.pdf: .PHONY
	cd $* && make $*.pdf

clean:
	for DIR in $(SOURCES); do cd $$DIR && make clean; done

words:
	for DIR in $(SOURCES); do cd $$DIR && make words; done
