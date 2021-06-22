.PHONY: clean

docs/index.html: src/desempleo-enoa.Rmd docs/data.json
	R -e "rmarkdown::render('src/desempleo-enoa.Rmd', output_file='../docs/index.html')"

docs/data.json: src/make_render.py
	python src/make_render.py

clean:
	rm --force docs/index.html
	rm --force docs/data.json