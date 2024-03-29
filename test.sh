#!/usr/bin/env bash
set -e

echo
echo "=====[ TEST ]===================================================="

git clone git@gitlab.com:javanile/fixtures/private-repository.git

cd private-repository

date > TEST

git add .
git commit -am "TEST"
git push

cd ..

rm -fr private-repository
