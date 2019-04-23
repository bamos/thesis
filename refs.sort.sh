#!/bin/bash

set -x

biber --tool --configfile=refs.conf --output-file=refs.bib refs.bib
