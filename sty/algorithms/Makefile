.PHONY: install
install: algorithmic.sty
	install -d ~/texmf/tex/latex/local
	install -m 644 algorithmic.sty ~/texmf/tex/latex/local

algorithmic.sty : algorithms.dtx algorithms.ins
	uplatex algorithms.ins


.PHONY: clean
clean:
	rm -f algorithm.sty algorithmic.sty algorithms.log
