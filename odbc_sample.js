// odbc_sample.js

const odbc = require("odbc");

async function main() {
  try {
    // Example DSN (configured in /etc/odbc.ini)
    const connectionString = "DSN=FREEPDB1;UID=sample_user;PWD=Sample123;";

    const connection = await odbc.connect(connectionString);
    console.log("✅ Connected to database!");

    const result = await connection.query("SELECT * FROM employees");
    console.table(result);

    await connection.close();
    console.log("🔒 Connection closed.");
  } catch (err) {
    console.error("❌ Error:", err);
  }
}

main();
