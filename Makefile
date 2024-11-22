.PHONY: build-container
build-container:
	DOCKER_BUILDKIT=1 docker build . -t pdflatex

.PHONY: cv
cv: build-container
	docker run --rm -i pdflatex <cv.tex >cv.pdf
