DOCNAME=template

all: compile

.PHONY: clean

compile: tidy
	pdflatex $(DOCNAME).tex
	biber $(DOCNAME).bcf
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex

tidy:
	sed -e 's/\s*$$//' -i $(DOCNAME).tex

view: compile
	open $(DOCNAME).pdf

clean:
	rm *.blg *.bbl *.aux *.log *.ps *.bcf *.dvi *.xml *.toc
