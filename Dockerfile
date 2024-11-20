# Latest LTS
FROM ubuntu:24.04

# Add metadata
LABEL maintainer="m@tthew.io" \
      version="1.0" \
      description="Build my CV with LaTeX"


# Create a non-root user
RUN useradd -m -s /bin/bash tex

# Switch to the non-root user
USER tex

# Set the working directory
WORKDIR /home/tex

# Install TeXLive
# curl and unzip in separate steps to minimize re-downloading (via Docker cache)
RUN curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar -xzvf install-tl-unx.tar.gz \
  && cd install-tl-*
  && perl ./install-tl

# Copy the application code
COPY ./cv.tex .

