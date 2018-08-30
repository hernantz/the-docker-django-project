#!/bin/bash

set -eoux pipefail

if [ "$1" == 'init' ]; then
    echo "Run Migrations"
    pipenv run ${SITE_DIR}/manage.py migrate
    pipenv run ${SITE_DIR}/manage.py collectstatic --no-input
elif [ "$1" == 'manage' ]; then
    shift
    echo "Manage.py $@"
    pipenv run ${SITE_DIR}/manage.py $@
else
    exec "$@"
fi
