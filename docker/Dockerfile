# Latest LTS
FROM ubuntu:24.04

# Add metadata
LABEL maintainer="m@tthew.io" \
      version="1.0" \
      description="Build my CV with LaTeX"

RUN apt-get update -y && apt install -y zsh
ADD install_latex.sh .
RUN ./install_latex.sh 1>&2 && rm ./install_latex.sh
ENV PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH

ADD install_latex_pkgs.sh .
RUN ./install_latex_pkgs.sh 1>&2 && rm ./install_latex_pkgs.sh

# Create a non-root user
RUN useradd -m -s /bin/bash tex

# Switch to the non-root user
USER tex

# Set the working directory
WORKDIR /home/tex

ADD run_latex.sh .
ENTRYPOINT [ "./run_latex.sh" ]
