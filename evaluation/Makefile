plotfiles=$(wildcard *.plt)
svgfiles = $(patsubst %.plt,%.svg,$(plotfiles))
pdffiles = $(patsubst %.plt,%.pdf,$(plotfiles))

SUBDIRS = ${shell ls -d */ | sed 's/\///' -}

%.pdf: %.plt %.dat
	gnuplot $<
	if [ -e $*.eps ]; then \
		ps2pdf -dEPSCrop $*.eps $*.pdf; \
	elif [ -e $*.svg ]; then \
		rsvg-convert -f pdf -o $*.pdf $*.svg; \
	fi

all:
	@for dir in $(SUBDIRS); do \
		make -C $$dir;\
	done

.PHONY: clean clean_dat
clean: 
	rm -f */*.svg */*.eps */*.pdf
clean_dat:
	rm -f */*.dat */*.svg */*.eps */*.pdf