default: build

build:
		xelatex -file-line-error -halt-on-error -shell-escape thesis.tex
		biber thesis
		xelatex -file-line-error -halt-on-error -shell-escape thesis.tex
		xelatex -file-line-error -halt-on-error -shell-escape thesis.tex
		cp thesis.pdf bamos_thesis.pdf
	  # latexmk --pdf -xelatex thesis.tex
	  latexmk -c thesis.tex

clean:
	  latexmk -C thesis.tex
	  rm -f *.log *.aux *.brf *.bbl *.blg *.xml
