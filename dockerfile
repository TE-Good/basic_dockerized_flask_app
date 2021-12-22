# NOTE: Probably out of date package that flask doesn't support
# FROM ubuntu:16.04
FROM python:3.9-alpine

MAINTAINER Tom Good "tom.good1990@gmail.com"

# NOTE: Not required if not installing ubuntu
# RUN apt-get update -y && \
#     apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

# Sets the "working directory" - all following commands run in this directory
WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
