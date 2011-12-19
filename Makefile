

index.html: index.html.pre bib2xhtml-2.35/cv.html
	m4 index.html.pre > index.html

bib2xhtml-2.35/cv.html: ~/Dropbox/Documents/Resume/cv.bib
	(cd bib2xhtml-2.35/; ./build.sh)