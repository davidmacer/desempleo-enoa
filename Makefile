docs/index.html: src/desempleo-enoa.Rmd
	R -e "rmarkdown::render('src/desempleo-enoa.Rmd', output_file='../docs/index.html')"
