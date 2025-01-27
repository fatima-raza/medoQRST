var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');
const db = require('./config/db'); // Database initialization
const bedRoutes = require('./src/routes/BedRoutes'); // Routes for Bed entity

var app = express();

// open port to run api
var port = process.env.PORT || 8090;

// middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());

//base URI for routes
app.use('/api', bedRoutes);

app.listen(port);
console.log('Bed API is running at ' + port);

// connect to the database
db.connectToDatabase().then(result => {
    console.log(result);
})



