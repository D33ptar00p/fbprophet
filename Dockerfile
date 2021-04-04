FROM python:3.6.8-slim

WORKDIR /app

RUN apt-get -y update  && apt-get install -y \
  python3-dev \
  apt-utils \
  python-dev \
  build-essential \
&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade setuptools
RUN pip install --default-timeout=10000 cython
RUN pip install --default-timeout=10000 numpy
RUN pip install --default-timeout=10000 pandas
RUN pip install --default-timeout=10000 matplotlib
RUN pip install --default-timeout=10000 convertdate
RUN pip --default-timeout=10000 --no-cache-dir install pystan
RUN pip install --default-timeout=10000 lunarcalendar
RUN pip install --default-timeout=10000 holidays
RUN pip install --default-timeout=10000 tqdm
RUN pip --default-timeout=10000 --no-cache-dir install fbprophet

# Following CMD keeps the container running
# Modify CMD to run the app that you require.
CMD tail -f /dev/null &

