#!/usr/bin/env bash

versions=(
  19.03.8
)

for version in "${versions[@]}"; do
  mkdir -p ${version}
  sed -e 's!%{version}!'"${version}"'!' Dockerfile.template > ${version}/Dockerfile
  cp docker-compose ${version}/docker-compose
  chmod +x ${version}/docker-compose
  docker build -t javanile/docker-ci:${version} ${version}
  docker push javanile/docker-ci:${version}
done

git add .
git commit -am "new release"
git push
