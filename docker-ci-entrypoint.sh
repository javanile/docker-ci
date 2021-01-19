#!/usr/bin/env bash

echo "Docker CI"

if [[ -f "${GITLAB_DEPLOY_KEY}" ]]; then
    echo "Found deploy key: ${GITLAB_DEPLOY_KEY}"
    cp ${GITLAB_DEPLOY_KEY} /root/.ssh/deploy_key
fi

exec docker-entrypoint.sh "$@"
