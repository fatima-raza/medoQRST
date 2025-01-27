var express = require('express');
const bedController = require('../controllers/BedController');
const router = express.Router();

router.get('/bed', bedController.getBeds);
router.get('/bed/:bedNo/:wardNo', bedController.getBed);

module.exports = router;
