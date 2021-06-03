FROM python:3
WORKDIR /workdir
COPY . .
RUN pip install \
    black \
    clean_enoa \
    flake8 \
    jinja2