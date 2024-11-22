# Latest LTS
FROM ubuntu:24.04

# Add metadata
LABEL maintainer="m@tthew.io" \
      version="1.0" \
      description="Build my CV with LaTeX"

# Install binary deps
RUN apt-get update -y
RUN apt-get install -y \
  curl \
  perl-base \
  cpanminus

# Install necessary cpan module for TeXLive
RUN cpanm -i \
  LWP \
  Log::Log4perl \
  Pod::Usage

# Download and untar TeXLive
RUN curl -L https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
  | tar -xvzf -

# Install TeXLive
# Notes:
# --scheme=basic installs TeX and LaTeX and not much else
#  - --scheme=infraonly doesn't install latex, only tex!
#  - see https://tex.stackexchange.com/questions/668613/pdflatex-not-found-after-fresh-tex-live-installation-ubuntu
# --paper=letter changes the default from A4
RUN cd install-tl-* \
  && perl ./install-tl --no-interaction --scheme=basic --paper=letter
ENV PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH

# Install the LaTeX packages that my CV templates uses
# Notes:
# - 'tools' contains tabularx, array & calc
#   (see https://www.ctan.org/pkg/tabularx, "Contained in")
# - 'latex' contains 'ifthen' and 'inputenc'.
#   (it should always be present. It's a "required" latex package)
# - This uses 'xargs' running three child processes to install these in parallel
# - RUN uses /bin/sh, which, by default, is 'dash' on ubuntu. While 'bash' only
#   interprets C literals ('\n' below) inside of $'...' strings, dash
#   interprets them as special characters everywhere, including inside '...'
#   strings. So the below is sufficient (unless Ubuntu changes /bin/sh...)
RUN echo '\
geometry\n\
titlesec\n\
tools\n\
xcolor\n\
enumitem\n\
fontawesome5\n\
amsmath\n\
hyperref\n\
eso-pic\n\
bookmark\n\
lastpage\n\
changepage\n\
paracol\n\
latex\n\
needspace\n\
iftex\n\
moderncv\n\
' | xargs -P3 -I{} tlmgr install '{}'

# Create a non-root user
RUN useradd -m -s /bin/bash tex

# Switch to the non-root user
USER tex

# Set the working directory
WORKDIR /home/tex

CMD [ "/bin/sh", "-c", "cat >doc.tex && pdflatex doc.tex 1>&2 && cat doc.pdf" ]
