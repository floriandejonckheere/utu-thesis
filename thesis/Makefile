all: Dejonckheere_Florian_Thesis.pdf

.PHONY:

Dejonckheere_Florian_Thesis.pdf: Dejonckheere_Florian_Thesis.typ template.typ chapters/*.typ appendices/*.typ bibliography/*.yml data/*.yml figures/**/*.typ
	typst compile Dejonckheere_Florian_Thesis.typ

watch:
	typst watch Dejonckheere_Florian_Thesis.typ

clean:
	rm -f **/*.pdf

%.pdf: %.typ template.typ
	typst compile $<

words:
	for FILE in *.pdf; do echo "$${FILE}: `ps2ascii $${FILE} | wc -w` words"; done
