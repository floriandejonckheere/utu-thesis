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
	rm *.blg *.bbl *.aux *.log *.ps *.bcf *.dvi *.xml *.toc
