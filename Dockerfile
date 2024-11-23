# Latest LTS
FROM ubuntu:24.04

# Add metadata
LABEL maintainer="m@tthew.io" \
      version="1.0" \
      description="Build my CV with LaTeX"

ADD install_latex.sh .
RUN ./install_latex.sh && rm ./install_latex.sh
ENV PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH

# Create a non-root user
RUN useradd -m -s /bin/bash tex

# Switch to the non-root user
USER tex

# Set the working directory
WORKDIR /home/tex

CMD [ "/bin/sh", "-c", "cat >doc.tex && pdflatex doc.tex 1>&2 && cat doc.pdf" ]
