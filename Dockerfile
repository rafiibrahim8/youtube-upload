FROM python:3.13.0a3-slim

ENV workdir /data
WORKDIR ${workdir}

RUN mkdir -p ${workdir} && adduser python --disabled-password
COPY . ${workdir}
WORKDIR ${workdir}
RUN pip install --upgrade google-api-python-client oauth2client progressbar2 && \
    python setup.py install

USER python

ENTRYPOINT ["youtube-upload"]
