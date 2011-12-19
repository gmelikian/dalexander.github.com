./bib2xhtml -c -s empty  ~/Dropbox/Documents/Resume/cv.bib  > cv.html.pre
grep -A1000 BEGIN cv.html.pre | grep -B1000 END | grep -v Dropbox > cv.html
