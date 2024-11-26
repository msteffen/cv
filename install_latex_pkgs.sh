#!/bin/zsh

set -ex

# Install the LaTeX packages that my CV templates uses
# Notes:
# - 'tools' contains tabularx, array, calc, and verbatim
#   (see e.g. https://www.ctan.org/pkg/tabularx, "Contained in")
#   (verbatim provides multi-line comments)
# - 'latex' contains 'ifthen' and 'inputenc'.
#   (it should always be present. It's a "required" latex package)
latex_pkgs=(
  geometry
  titlesec
  tools
  xcolor
  enumitem
  fontawesome5
  amsmath
  hyperref
  eso-pic
  bookmark
  lastpage
  changepage
  paracol
  latex
  needspace
  iftex
  moderncv
)
if which vim; then
  # For installing locally & use with vimtex
  latex_pkgs+=( latexmk )
fi

# This (old) approach used 'xargs' running three child processes to install
# these in parallel. Unfortunately, this seems to crash intermittently. Leaving
# it here in case I figure out how to fix it soon...
# IFS=$'\n'
# echo "${latex_pkgs[*]}" | xargs -P3 -I{} tlmgr install '{}'

# Instead, just install the packages normally, for now
# NB zsh will expand $latex_pkgs correctly below (parameter expansion is more
#    sane than bash)
tlmgr install $latex_pkgs
