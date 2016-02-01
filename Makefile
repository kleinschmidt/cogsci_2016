all: kleinschmidt_2_1.pdf

%.tex: %.Rnw
	Rscript -e "knitr::knit('$<')"
%.pdf: %.tex
	latexmk $< -quiet

kleinschmidt_2_1.pdf: kleinschmidt_infer_priors_cogsci.pdf
	cp $< $@
