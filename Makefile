.PHONY: init-repo
init-repo:
	@# got this idea from
	@# https://stackoverflow.com/questions/427207/can-git-hook-scripts-be-managed-along-with-the-repository
	git config core.hooksPath githooks

.PHONY: build-container
build-container:
	DOCKER_BUILDKIT=1 docker build . -t pdflatex

.PHONY: cv
cv: build-container
	tar -cvzf - *.tex | docker run -i pdflatex cv.tex | tar -xvzf -
