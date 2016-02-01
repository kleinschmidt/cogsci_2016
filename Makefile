all: kleinschmidt_infer_priors_cogsci.pdf
%.tex: %.Rnw
	Rscript -e "knitr::knit('$<')"
%.pdf: %.tex
	latexmk $< -quiet
