.phony: default
default:
	- latexmk -cd -e -f -pdf -interaction=nonstopmode -synctex=1 "basics.tex"
