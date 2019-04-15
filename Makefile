STYLE_MAKEFILES := $(shell find ./sty -name Makefile)
FIGURES := 

main.pdf: main.dvi
	dvipdfmx $<

main.dvi: main.tex bib.bib $(FIGURES) styles
	platex $<
	bibtex $(basename $<)
	platex $<
	platex $<
	platex $<

.PHONY: styles
styles:
	for makefile_path in $(STYLE_MAKEFILES); do\
	    cd $${makefile_path%/*} && make;\
	done


.PHONY: clean
clean:
	rm -f main.aux main.bbl main.blg main.dvi main.log main.pdf
	for makefile_path in $(STYLE_MAKEFILES); do\
	    cd $${makefile_path%/*} && make clean;\
	done
