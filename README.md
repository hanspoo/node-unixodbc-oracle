# 🐋 Docker Setup – nodejs + Oracle via unixODBC

```
git clone https://github.com/hanspoo/node-unixodbc-oracle
cd node-unixodbc-oracle
```

## Start Oracle Server

```
docker compose up
```

## Build node app with unixodbc and oracle drivers

```
docker build --no-cache -t torpedo-base -f Dockerfile .
docker build --no-cache -t torpedo:1.0 -f Dockerfile.odbc .
```

## Execute the node app

```
docker run -it --rm torpedo:1.0
```

---

## 📘 Overview

The goal of this project is to build a **Docker image** capable of running a **nodejs** application that connects to an **Oracle Database** using **unixODBC** as the communication layer.

This setup allows the Node application (running on Express) to query the Oracle server directly within a containerized environment.

---

## 🧱 Architecture

The environment consists of the following components:

1. **Oracle Database Server (Base Image)**

   - Uses the official **Oracle Free** Docker image as the foundation.
   - Provides the database engine and listener running on TCP port `1521`.

   Just for developing, our real database usually will be elsewhere.

2. **nodejs + Express Application**

   - Built on top of the base image or as a separate service.
   - Communicates with Oracle through **unixODBC**.
   - Contains the Express server that handles application logic and routes.

3. **unixODBC Support**

   - Installed in the base layer to enable ODBC communication between Node.js and Oracle.
   - Configured with the proper ODBC drivers and DSN connection settings.

---

## 🧩 Dockerfile Strategy

Initially, the setup included **two Dockerfiles**:

- One that created a **base image** with unixODBC support.
- Another that inherits from the previouse one, the **nodejs web application** connected to the database.

These two dockerfiles can be **merged into a single Dockerfile**.

However, the chosen approach is to:

- Use the **official Oracle instant client image** as the base for the webapp.
- Add **nodejs and unixODBC** on top, both sourced from their **official repositories**.

This ensures compatibility, maintainability, and a more transparent image-building process.

---

## ⚙️ Example Build Flow

Once all is running:

- The Oracle server will listen on port **1521**.
- The Express app (nodejs) will be available on port **3000**.
- Both services communicate internally using unixODBC.

---

## 🧾 Notes

- The **Oracle image** and **Node.js runtime** are pulled from official repositories.
- The **unixODBC configuration files** (`odbcinst.ini`, `odbc.ini`) should define the DSN for the Oracle database.
- The **Express application** must use the `odbc` npm package to connect through the defined DSN.

---
