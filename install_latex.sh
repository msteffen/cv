#!/bin/zsh

set -ex

# This script installs latex. It's a helper for (and was initially factored out
# of 'Dockerfile'. This was to make it easy to install LaTeX on the host
# machine as well, which has proven necessary for e.g. vimLaTeX.

# Install binary deps
apt-get update -y
apt-get install -y \
  curl \
  perl-base \
  cpanminus

# Install necessary cpan module for TeXLive
cpanm -i \
  LWP \
  Log::Log4perl \
  Pod::Usage

# Download and untar TeXLive
pushd /tmp

curl -L https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
  | tar -xvzf -

# Install TeXLive
# Notes:
# --scheme=basic installs TeX and LaTeX and not much else
#  - --scheme=infraonly doesn't install latex, only tex!
#  - see https://tex.stackexchange.com/questions/668613/pdflatex-not-found-after-fresh-tex-live-installation-ubuntu
# --paper=letter changes the default from A4
pushd install-tl-* \
  && perl ./install-tl --no-interaction --scheme=basic --paper=letter
popd

rm -rf install-tl-*
popd

export PATH="/usr/local/texlive/2024/bin/x86_64-linux/:${PATH}"

