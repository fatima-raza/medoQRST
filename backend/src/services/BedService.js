const sql = require("mssql/msnodesqlv8");
const config = require("../../config/dbconfig");
var Bed = require('../models/BedModel');

async function getBeds() {
    try {
        let pool = await sql.connect(config);
        let beds = await pool.request().query("SELECT * FROM Bed");
        return beds.recordsets;
    } catch (error) {
        console.log(error);
    }
}

async function getBed(bedNo, wardNo) {
    try {
        const pool = await sql.connect(config);
        const bed = await pool.request()
            .input('bedNo', sql.Int, bedNo) // Input for Bed_no
            .input('wardNo', sql.Char(3), wardNo) // Input for Ward_no
            .query(
                `SELECT * FROM Bed WHERE Bed_no = @bedNo AND Ward_no = @wardNo`
            );
        return bed.recordset; // Return recordset (array of rows)
    }
    catch (error) {
        console.error('Error fetching bed:', error); // Detailed error message
        throw error; // Re-throw the error for higher-level handling
    }
}

module.exports = {
    getBeds: getBeds,
    getBed: getBed,
};
