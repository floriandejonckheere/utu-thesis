SOURCES := $(wildcard *.tex)
DOCUMENTS := $(patsubst %.tex,%.pdf,$(SOURCES))

all: tidy $(DOCUMENTS)

.PHONY:

%.pdf: .PHONY
	sed -e 's/\s*$$//' -i $*.tex
	pdflatex $*.tex
	biber $*.bcf
	pdflatex $*.tex
	pdflatex $*.tex

tidy:
	sed -e 's/\s*$$//' -i *.tex

clean:
	rm -f *.blg *.bbl *.aux *.log *.ps *.bcf *.dvi *.xml *.toc *.gz

words:
	for FILE in *.pdf; do echo "$${FILE}: `ps2ascii $${FILE} | wc -w` words"; done
