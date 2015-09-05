#!/bin/bash

set -e

cp -r ~/projects/sphinx-tutorial/_build/html/ tutorial

mkdir crawler
cp -r ~/projects/sphinx-tutorial/crawler/src crawler/src

mkdir docs
cp -r ~/checkouts/sphinx/doc/_build/html/ docs/sphinx

mkdir -p usb

cd usb

mkdir -p Mac
mkdir -p Windows

cd Mac
wget -c https://www.python.org/ftp/python/2.7.10/python-2.7.10-macosx10.6.pkg
cd ..

cd Windows
wget -c http://www.python.org/ftp/python/2.7.10/python-2.7.10.msi
cd ..

mkdir -p packages

pip install -d packages sphinx virtualenv requests beautifulsoup4 recommonmark
pip install --no-use-wheel -d packages sphinx virtualenv requests beautifulsoup4 recommonmark

if [ ! -d tutorial ]
then
    git clone https://github.com/ericholscher/sphinx-tutorial tutorial
fi

if [ ! -d rsted ]
then
    git clone https://github.com/anru/rsted
fi

pip install -d packages -r rsted/pip-requirements.txt
pip install --no-use-wheel -d packages -r rsted/pip-requirements.txt

cp install.sh usb

echo Done building!
