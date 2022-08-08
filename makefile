######################################################################
# 
# makefile 
#  fuer normale Latex-Projekte
#
# Anzupassen sind: GENDIR, MAINTEX und ggf. BIB

# target folder
GENDIR=target/

# primary tex file
MAINTEX=cv_english.tex
SECOND=cv_german.tex


# Bibfile
#BIB=src/bib/Literatur.bib

# target:
TARGET=$(GENDIR)$(MAINTEX:.tex=.pdf)

# all used latex sources
SOURCES=$(MAINTEX) $(wildcard *.tex)

# to trac changes of pictures
PICTURES=$(wildcard *)

######################################################################
# creates the target and displays warnings
all: $(TARGET) warnings

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
$(TARGET): $(SOURCES) $(BIB) $(PICTURES)
	@mkdir -p ${GENDIR}
	@echo "------------initial pdf-latex run"
	@pdflatex -shell-escape -output-directory=${GENDIR} ${MAINTEX}
	@pdflatex -shell-escape -output-directory=${GENDIR} ${SECOND}
	@echo "------------${TARGET}"     

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# delete temporary files
clean:
	@rm -rf $(GENDIR)

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# collect and print warnings from log-files
warnings:
	@-echo "------------ Warnings from bib:"
	@-grep arning $(TARGET:.pdf=.blg)
	@-echo "------------ Warnings from latex:"
	@-grep arning: $(TARGET:.pdf=.log) | wc -l
	@awk '/arning:/' RS= $(TARGET:.pdf=.log)
