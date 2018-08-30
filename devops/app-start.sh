#!/bin/bash

echo "Starting uWSGI for ${PROJECT_NAME}"

pipenv run uwsgi --chdir ${SITE_DIR} \
    --module=${PROJECT_NAME}.wsgi:application \
    --master \
    --env DJANGO_SETTINGS_MODULE=${PROJECT_NAME}.settings \
    --vacuum \
    --max-requests=5000 \
    --virtualenv $(pipenv --venv) \
    --socket 0.0.0.0:8000 \
    --processes $NUM_PROCS \
    --threads $NUM_THREADS \
    --python-autoreload=1
