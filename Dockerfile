FROM ghcr.io/oracle/oraclelinux8-instantclient:21

RUN dnf module reset nodejs && \
    dnf module enable nodejs:22 -y && \
    dnf install -y nodejs unzip npm

RUN dnf install -y unixODBC unixODBC-devel

COPY instantclient-odbc-linux.x64-21.20.0.0.0dbru.zip /
RUN unzip instantclient-odbc-linux.x64-21.20.0.0.0dbru.zip
RUN cp instantclient_21_20/libsqora.so.21.1 /usr/lib/oracle/21/client64/lib

COPY odbcinst.ini /etc/odbcinst.ini

CMD ["tail", "-f", "/dev/null"]

