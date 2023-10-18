SOURCES := proposal
DOCUMENTS := $(patsubst %,%.pdf,$(SOURCES))

all: tidy $(DOCUMENTS)

.PHONY:

%.pdf: .PHONY
	cd $* && make $*.pdf

tidy: .PHONY
	for DIR in $(SOURCES); do cd $$DIR && make tidy; done

clean:
	for DIR in $(SOURCES); do cd $$DIR && make clean; done

words:
	for DIR in $(SOURCES); do cd $$DIR && make words; done
