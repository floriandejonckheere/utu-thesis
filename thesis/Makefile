all: thesis.pdf

.PHONY:

thesis.pdf: thesis.typ chapters/*.typ
	typst compile thesis.typ

clean:
	rm -f *.pdf chapters/*.pdf

%.pdf: %.typ template.typ
	typst compile $<

words:
	for FILE in *.pdf; do echo "$${FILE}: `ps2ascii $${FILE} | wc -w` words"; done