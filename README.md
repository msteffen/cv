# Résumé (CV)

I had to call the repo "cv" to avoid ambiguity with the opposite of "pause".

## How to Build

Right now, I'm using a LaTeX template, and a Docker image to compile.

- `Dockerfile` defines a Docker image (based on Ubuntu:24.04) with TeXLive installed, as well as all packages needed to build the resumé.
- To build the Docker image, run `make build-container`
- To build `cv.tex`, run `make cv`. This will output `cv.pdf` (ignored by Git)

## TODO

Someday I may re-do this in Typst. I would also like to use Bazel instead of Docker, so that I can easily run the build process on my MacBook Air, but when I attempted to use https://github.com/ProdriveTechnologies/bazel-latex, some packages that I needed were missing (I hesitated to request that they be added because I wasn't sure if I wanted to use Bazel at all. But it would be nice if I could get it to work).
