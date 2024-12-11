#!/bin/zsh

set -ex

FILE=$1

{
  cat >'in.tar'
  tar -xvzf 'in.tar'
  for i in $(seq 3); do
    pdflatex $FILE
  done
} 1>&2
tar -cvzf - *.pdf *.log
