# Pull base image
FROM python:3.7-slim

# Install system packages
RUN apt-get update && \
    apt-get upgrade -y && \
    pip install pipenv

# Build arguments
ARG PIPENV_FLAGS

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install dependencies
COPY ./Pipfile.lock ./Pipfile ./
RUN pipenv install ${PIPENV_FLAGS}
#RUN pipenv install flask==1.0.3 && pipenv install --dev pytest==4.6.3 black==19.3b0 flake8==3.7.7 mypy==0.710 isort==4.3.20

# Copy project
COPY . .

ENTRYPOINT FLASK_APP=flask_app/app.py pipenv run flask run -h 0.0.0.0
