sheets := $(wildcard src/*.tex)
pdfs   := $(subst src/,docs/,$(subst .tex,.pdf,$(sheets)))
thumbnails := $(subst src/,assets/,$(subst .tex,.png,$(sheets)))

all: $(pdfs) $(thumbnails)

docs/%.pdf : src/%.tex
	- latexmk -cd -e -f -pdf -interaction=nonstopmode -synctex=1 \
			-output-directory=./../docs/ \
			$<
	- cd docs/ && latexmk -c

assets/%.png : docs/%.pdf
	- gs -sDEVICE=png16m \
		 -r600 \
		 -dPDFFitPage=true \
		 -dDEVICEWIDTHPOINTS=250 \
		 -dDEVICEHEIGHTPOINTS=150 \
		 -dDownScaleFactor=4 \
		 -sOutputFile=$@ \
		 -dLastPage=1 \
		 -dBATCH -dNOPAUSE \
		 $<

.phony : clean
clean:
	- cd docs/ && latexmk -c
