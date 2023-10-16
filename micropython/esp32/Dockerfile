FROM docker.io/ubuntu:jammy
LABEL org.opencontainers.image.authors="licsber<admin@licsber.site>"

WORKDIR /licsber

ADD tuna.sources.list /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y git python3 python3-pip libusb-1.0-0-dev cmake && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone -b v5.0.4 --recursive https://github.com/espressif/esp-idf.git

ENV IDF_PATH='/licsber/esp-idf'

RUN cd esp-idf &&  \
    ./install.sh && \
    rm -rf /root/.cache && \
    rm -rf /root/.espressidf/dist

RUN git clone https://github.com/licsber/micropython.git

RUN cd micropython && \
    make -C mpy-cross

RUN cd micropython && \
    cd ports/esp32 && \
    make submodules && \
    . "$IDF_PATH/export.sh" && \
    make BOARD=LICSBER_8M_W5500
