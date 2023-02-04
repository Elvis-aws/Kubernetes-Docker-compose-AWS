FROM python:3-alpine3.11
ENV PYTHONDONTWRITEBYTECODE=1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1


WORKDIR /app
COPY requirements.txt /app
RUN pip install -r requirements.txt
# First we copy requirements.txt and we install
# Then we copy every thing to increase performance
# Install wil only run if requirements.txt file changes
COPY . /app
# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app

USER appuser

RUN chmod +x ./runner.sh

CMD . runner.sh