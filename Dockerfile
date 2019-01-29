FROM python:3.6-slim
WORKDIR /app
COPY requirements.txt .
RUN apt-get update && apt-get install -y git wget build-essential
RUN apt-get install -y liblz4-dev libsnappy-dev zlib1g-dev libbz2-dev libgflags-dev #!COMMIT
RUN wget https://github.com/facebook/rocksdb/archive/v5.17.2.tar.gz &&\
tar xvf v5.17.2.tar.gz &&\
cd rocksdb-5.17.2 &&\
make shared_lib &&\
make install-shared INSTALL_PATH=/usr &&\
cd .. && rm -rf rocksdb-5.17.2 #!COMMIT
COPY . . #!COMMIT
