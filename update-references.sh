#!/bin/bash
set -e

scriptdir=$(cd $(dirname $0); pwd -P)

cd $scriptdir
rm -f main.blg main.bbl
ck genbib references.bib
