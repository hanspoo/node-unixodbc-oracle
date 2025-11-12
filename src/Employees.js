// odbc_sample.js

import odbc from "odbc";

export class Employees {
  static async findAll() {
    const connectionString = "DSN=FREEPDB1;UID=sample_user;PWD=Sample123;";

    const connection = await odbc.connect(connectionString);
    console.log("✅ Connected to database!");

    return connection.query("SELECT * FROM employees");
  }
}
