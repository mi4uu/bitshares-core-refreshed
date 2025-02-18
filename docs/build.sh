#!/bin/bash

cd gen-docs01/docs
uv run mkdocs build -d ../../site
