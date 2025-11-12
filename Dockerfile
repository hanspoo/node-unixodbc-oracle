FROM ghcr.io/oracle/oraclelinux8-instantclient:21

COPY odbcinst.ini /etc/odbcinst.ini

RUN dnf module reset nodejs && \
    dnf module enable nodejs:18 -y && \
    dnf install -y nodejs unzip

RUN dnf install -y unixODBC unixODBC-devel

CMD ["tail", "-f", "/dev/null"]

