all: $(patsubst %.tex, %.pdf, $(wildcard *.tex))

%.pdf: %.tex
	latexmk -pdf -shell-escape $<

clean:
	latexmk -c
	rm -f *.aux *.fls *.log *.nls *.nlo *.bbl *.blg *.fdb_latexmk *.run.xml *.lof *.lot *.glo *.bcf *.out *.toc
