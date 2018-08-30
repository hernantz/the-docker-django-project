FROM python:3.7

ENV PYTHONBUFFERED 1
ARG SITE_DIR

RUN mkdir -p $SITE_DIR

WORKDIR $SITE_DIR

COPY ./mysite/ $SITE_DIR

ADD ./devops/entrypoint.sh /entrypoint.sh
ADD ./devops/app-start.sh /app-start.sh

RUN pip install pipenv && pipenv install --deploy --ignore-pipfile --dev

# Set a custom entrypoint to let us provide custom initialization behavior
ENTRYPOINT ["/entrypoint.sh"]

# Set the command to start uwsgi
CMD ["/app-start.sh"]
