all: thesis.pdf

.PHONY:

thesis.pdf: thesis.typ template.typ chapters/*.typ appendices/*.typ bibliography/*.yml data/*.yml figures/**/*.typ
	typst compile thesis.typ

watch:
	typst watch thesis.typ

clean:
	rm -f **/*.pdf

%.pdf: %.typ template.typ
	typst compile $<

words:
	for FILE in *.pdf; do echo "$${FILE}: `ps2ascii $${FILE} | wc -w` words"; done
