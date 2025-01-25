// configuring connection string


// module.exports = {
//     connectionString: 'Driver={ODBC Driver 17for SQL Server};Server=DESKTOP-U35PCHH\\SQLEXPRESS;Database=medoQRST;Trusted_Connection=yes;'
// }

const config = {
    server: 'DESKTOP-U35PCHH\\SQLEXPRESS',
    database: 'medoQRST',
    options: {
        // encrypt: true,
        trustServerCertificate: true,
        trustedConnection : true,
        enableArithAbort : true,
        // instancename : 'SQLEXPRESS'
    },
    port : 1433,
    driver: 'ODBC Driver 17for SQL Server',
};


module.exports = config;