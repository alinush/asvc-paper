TEXNAME=main

all: clean figures latexmk

svg_to_eps: 
#figures/accaad.eps figures/precomp-memb.eps figures/AT.eps figures/forest.eps figures/frontier.eps figures/model.eps

svg_to_pdf: 
#figures/accaad.pdf figures/precomp-memb.pdf figures/AT.pdf figures/forest.pdf figures/frontier.pdf figures/model.pdf

figures: svg_to_eps svg_to_pdf

figures/%.eps: figures/%.svg
	inkscape -D -z --file=$(realpath $<) --export-eps=$(realpath .)/$@

figures/%.pdf: figures/%.svg
	inkscape -D -z --file=$(realpath $<) --export-dpi=300 --export-pdf=$(realpath .)/$@

clean:
	$(RM) ${TEXNAME}.pdf *.log *.aux \
	*.fls *.fdb_latexmk *.synctex.gz *.bcf\
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi

latexmk:
	# For some reason using -auxdir=build/ will result in failed builds
	latexmk -pdf ${TEXNAME}

open:
	xdg-open ${TEXNAME}.pdf
