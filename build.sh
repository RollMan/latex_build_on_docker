#!/bin/bash
set -eux
docker run -ti --rm -v $(realpath `dirname "$0"`):/workdir alpine-texlive-ja make
