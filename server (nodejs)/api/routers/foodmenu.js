const express = require('express');
const router = express.Router();
var request = require('request');
var url = "https://sheets.googleapis.com/v4/spreadsheets/1kgxnFxb9pOkPvKHMAqsMFbh5LrMYTrftUKyJQuBkR1o/values/yemekhane?key=AIzaSyDaIfxBmmFG875woD1RuKYugqCy5ZWMF48";
var foodList = null;

router.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*")
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
    next()
});

router.get('/', (req, res, next) => {
    request({
        url: url,
        json: true
    }, function (error, responce, body) {
        if(!error && responce.statusCode === 200) {
            foodList = body.values;
            res.status(200).json({
                message: 'here is the food menu',
                menu: foodList
            });
        }
    });
});

module.exports = router;
