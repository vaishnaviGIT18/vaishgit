FROM python:3.12.4-slim
LABEL maintainer="Vaishnavi"
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt requirements.txt
COPY ./webapp/ webapp
COPY ./models/model.joblib/model.joblib models/model.joblib/model.joblib

WORKDIR /webapp
EXPOSE 8000

RUN python -m venv / py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt && \
    adduser --disabled-password --no-create-home webapp

ENV PATH="/py/bin:$PATH"

USER webapp


