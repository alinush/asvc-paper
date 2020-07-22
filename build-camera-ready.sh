#!/bin/bash

set -e
scriptdir=$(cd $(dirname $0); pwd -P)

cd $scriptdir
rm -rf camera-ready/
mkdir -p camera-ready/

sed_cmd=gsed
which $sed_cmd &>/dev/null || sed_cmd=sed

cp main.tex /tmp/main.tex
$sed_cmd -i 's/%\\CameraReadytrue/\\CameraReadytrue/g' /tmp/main.tex
perl latexpand/latexpand /tmp/main.tex >camera-ready/main.tex

cp Makefile camera-ready/   # only temporarily

# Copy stuff Springer wants
cp consent.pdf camera-ready/
cp main.bbl camera-ready/
cp *.bib camera-ready/
cp *.bst camera-ready/
cp *.cls camera-ready/
cp *.sty camera-ready/

( cd camera-ready/ && make ) || :
rm -f camera-ready/Makefile # remove Makefile, Springer doesn't want it

tar czf camera-ready.tar.gz camera-ready/
