# What do you expect from an unfamiliar talker?

_Dave F. Kleinschmidt_ and _T. Florian Jaeger_, University of Rochester Department of Brain and Cognitive Sciences  
[Paper](kleinschmidt_infer_priors_cogsci.pdf) presented at CogSci 2016

Data is in this [`supunsup`](https://github.com/kleinschmidt/phonetic-sup-unsup) R package, and model code is in [`beliefupdatr`](https://github.com/kleinschmidt/beliefupdatr). Install them with

```r
devtools::install_github('kleinschmidt/phonetic-sup-unsup')
devtools::install_github('kleinschmidt/beliefupdatr')
```

The Makefile builds the paper using `knitr` and `pdflatex`

```shell
$ make
```
