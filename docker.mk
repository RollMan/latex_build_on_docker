STYLE_MAKEFILES := $(shell find ./sty -name Makefile)
LATEX := platex
BIBTEX := pbibtex
TEXFLAGS := -shell-escape
FIGURES := 
SRC := main.tex bib.bib $(FIGURES) styles
NO_ASPELL :=
IMGSRC := $(wildcard img/*.svg)
IMGOBJ := $(IMGSRC:%svg=%eps)

MAKEFILE_PATH := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

$(warning IMGSRC = $(IMGSRC))
$(warning IMGOBJ = $(IMGOBJ))

main.pdf: main.dvi
	dvipdfmx -l $<

main.dvi: $(SRC) $(IMGOBJ)
	$(LATEX) $(TEXFLAGS) $<
	$(BIBTEX) $(basename $<)
	$(LATEX) $(TEXFLAGS) $<
	$(LATEX) $(TEXFLAGS)  $<
	$(LATEX) $(TEXFLAGS) $<

.PHONY: styles
styles:
	for makefile_path in $(STYLE_MAKEFILES); do\
	    cd $(MAKEFILE_PATH)/$${makefile_path%/*} && make;\
	done


.PHONY: clean
clean:
	rm -f main.aux main.bbl main.blg main.dvi main.log main.pdf
	for makefile_path in $(STYLE_MAKEFILES); do\
	    cd $${makefile_path%/*} && make clean;\
	done

%.eps: %.svg
	inkscape $(shell ls img/*.svg) --export-type=eps;
