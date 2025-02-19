#!/bin/bash

cp ../README.md gen-docs01/docs/docs/readme.md
cp ../libraries/README.md gen-docs01/docs/docs/libs.md
cp ../programs/README.md gen-docs01/docs/docs/programs.md

cd gen-docs01/docs
uv run mkdocs build -d ../../site
cd ../..
cp -rf site/* .
rm -rf site
