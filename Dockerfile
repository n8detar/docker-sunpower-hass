FROM python:3.9.1
RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install virtualenv
ADD . /config
WORKDIR /config
RUN git clone https://github.com/jrconlin/sunpower_hass.git
RUN virtualenv -p python3 venv
RUN venv/bin/python setup.py install
RUN venv/bin/reading > reading.txt
CMD ["venv/bin/reading"]