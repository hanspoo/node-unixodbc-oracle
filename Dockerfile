# Option 1: Use Oracle's official Instant Client image
FROM ghcr.io/oracle/oraclelinux8-instantclient:21

# Fix DNS resolution
# RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf && \
#     echo "nameserver 8.8.4.4" >> /etc/resolv.conf
COPY odbcinst.ini /etc/odbcinst.ini


# Install Node.js on top of Oracle Instant Client
RUN dnf module reset nodejs && \
    dnf module enable nodejs:18 -y && \
    dnf install -y nodejs unzip



# Install additional dependencies if needed
RUN dnf install -y unixODBC unixODBC-devel

# RUN cd /usr/lib/oracle/21/client64 && \
#     curl -O https://download.oracle.com/otn_software/linux/instantclient/instantclient-odbc-linux.x64-21.13.0.0.0dbru.zip && \
#     unzip instantclient-odbc-linux.x64-21.13.0.0.0dbru.zip && \
#     rm instantclient-odbc-linux.x64-21.13.0.0.0dbru.zip

CMD ["tail", "-f", "/dev/null"]

