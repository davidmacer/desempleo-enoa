./docs/desempleo-enoa.html : ./src/desempleo-enoa.Rmd
	Rscript -e 'rmarkdown::render("./src/desempleo-enoa.Rmd")'