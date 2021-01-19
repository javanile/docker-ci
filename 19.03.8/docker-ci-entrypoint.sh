#!/usr/bin/env bash

echo "Docker CI"
echo " - WORKDIR: ${PWD}"

printenv

git config --global user.name "Docker CI"
git config --global user.email "${GITLAB_USER_EMAIL}"

if [[ -f "${GITLAB_DEPLOY_KEY}" ]]; then
    echo "Found deploy key: ${GITLAB_DEPLOY_KEY}"
    cp ${GITLAB_DEPLOY_KEY} /root/.ssh/deploy_key
    chmod 400 /root/.ssh/deploy_key
fi

exec docker-entrypoint.sh "$@"
