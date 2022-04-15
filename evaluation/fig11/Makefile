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
	python3 generate.py
