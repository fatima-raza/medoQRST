const sql = require("mssql/msnodesqlv8");
const config = require("./dbconfig");

async function connectToDatabase() {
    try {
        let pool = await sql.connect(config);
        console.log("Connected to SQL Server!");
    }
    catch (error) {
        console.error("Connection failed: ", error.message);
    }
}

module.exports = { connectToDatabase };
