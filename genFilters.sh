#!/bin/bash

git submodule update --init --recursive
git submodule update --remote

cd IATI-Standard-SSOT

if [ ! -d pyenv ]; then
  python3 -m venv pyenv
  source pyenv/bin/activate
  pip install -r requirements.txt
else
  source pyenv/bin/activate
fi

# Generate csvs etc. from codelists
cd IATI-Codelists || exit 1
./gen.sh || exit 1
cd .. || exit 1

python gen_dss.py "../filters.json" "../codelists.json"
