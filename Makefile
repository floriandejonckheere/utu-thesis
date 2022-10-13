DOCNAME=template

all: compile

.PHONY: clean

compile:
	pdflatex $(DOCNAME).tex
	biber $(DOCNAME).bcf
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex

view: compile
	open $(DOCNAME).pdf

clean:
	rm *.blg *.bbl *.aux *.log *.ps *.bcf *.dvi *.xml *.toc
