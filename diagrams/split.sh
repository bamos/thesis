#!/bin/bash

cd $(dirname $0)
pdfseparate diagrams.pdf diagrams-%d.pdf
for D in diagrams-*.pdf; do
    pdfcrop $D $D &
done
