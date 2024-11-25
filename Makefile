.PHONY: build-container
build-container:
	DOCKER_BUILDKIT=1 docker build . -t pdflatex

.PHONY: cv
cv: build-container
	tar -cvzf - *.tex | docker run -i pdflatex cv.tex | tar -xvzf -
