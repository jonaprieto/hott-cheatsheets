sheets := $(wildcard src/hott-*.tex)
pdfs   := $(subst src/,docs/,$(subst .tex,.pdf,$(sheets)))
thumbnails := $(subst src/,assets/,$(subst .tex,.png,$(sheets)))

all: $(pdfs) $(thumbnails)

docs/%.pdf : src/%.tex
	- @rm $@
	- @latexmk -cd -e -f -pdf -interaction=nonstopmode -synctex=1 \
		-output-directory=./../docs \
		$<

assets/%.png : docs/%.pdf
	- @rm $@
	- @gs -sDEVICE=png16m \
		 -r1200 \
		 -dPDFFitPage=true \
		 -dDEVICEWIDTHPOINTS=250 \
		 -dDEVICEHEIGHTPOINTS=150 \
		 -dDownScaleFactor=4 \
		 -sOutputFile=$@ \
		 -dLastPage=1 \
		 -dBATCH -dNOPAUSE \
		 $<

.phony: watch
watch:
	- watchmedo shell-command \
		--patterns="*" \
		--recursive \
		--command='make' \
		src

.phony: clean-auxlatex
clean-auxlatex:
	- @find docs ! -name *.pdf -maxdepth 1 -type f -delete

.phony: clean
clean:
	- @rm *.DS_Store
	- @rm assets/* docs/*
	- make clean-auxlatex

.phony: hard
hard:
	- make clean
	- make all
	- make clean-auxlatex

.phony: version
version:
	- make hard
	- $(eval VERSION := $(shell bash -c 'read -p "Tag version (vX.X.X): " pwd; echo $$pwd'))
	- $(eval MESSAGE := $(shell bash -c 'read -p "Commit message: " pwd; echo $$pwd'))
	- @git tag "$(VERSION)" -m "$(MESSAGE)"
	- @git commit -am "[ $(VERSION) ] $(MESSAGE)"
	- @@git push origin master --all
