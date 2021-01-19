#!/usr/bin/env bash

versions=(
  19.03.8
)

for version in "${versions[@]}"; do
  mkdir -p ${version}
  sed -e 's!%{version}!'"${version}"'!' Dockerfile.template > ${version}/Dockerfile
  cp config ${version}/config
  cp docker-compose ${version}/docker-compose
  cp docker-ci-entrypoint.sh ${version}/docker-ci-entrypoint.sh
  chmod +x ${version}/docker-compose ${version}/docker-ci-entrypoint.sh
  chmod 600 ${version}/config
  docker build -t javanile/docker-ci:${version} ${version}
  docker push javanile/docker-ci:${version}
done

git add .
git commit -am "new release"
git push
