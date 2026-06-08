# Makefile — сборка экзаменационных билетов
# latexmk сам делает нужное число проходов (datatool/tabularray).

TEXDIR := tex_form
OUTDIR := exam_cards
MAIN   := main
PDF    := $(OUTDIR)/exam_cards.pdf

LATEXMK := latexmk -pdf -interaction=nonstopmode -halt-on-error -output-directory=../$(OUTDIR)

.PHONY: all build clean distclean

all: build

# Собрать билеты в $(PDF)
build:
	cd $(TEXDIR) && $(LATEXMK) $(MAIN).tex
	mv $(OUTDIR)/$(MAIN).pdf $(PDF)

# Удалить промежуточные файлы сборки (.aux/.log/.fls/.fdb_latexmk)
clean:
	cd $(TEXDIR) && latexmk -c -output-directory=../$(OUTDIR) $(MAIN).tex

# Удалить всё, включая итоговый PDF
distclean:
	cd $(TEXDIR) && latexmk -C -output-directory=../$(OUTDIR) $(MAIN).tex
	rm -f $(PDF)
