default: build

build:
	xelatex -file-line-error -halt-on-error -shell-escape thesis.tex
	biber thesis
	xelatex -file-line-error -halt-on-error -shell-escape thesis.tex
	xelatex -file-line-error -halt-on-error -shell-escape thesis.tex
	latexmk -c thesis.tex
	cp thesis.pdf bamos_thesis.pdf

clean:
	latexmk -C thesis.tex
	rm -f *.log *.aux *.brf *.bbl *.blg *.xml
