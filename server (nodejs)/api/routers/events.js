const express = require('express');
const router = express.Router();
var request = require('request');
var url = "https://sheets.googleapis.com/v4/spreadsheets/1kgxnFxb9pOkPvKHMAqsMFbh5LrMYTrftUKyJQuBkR1o/values/etkinlikler?key=AIzaSyDaIfxBmmFG875woD1RuKYugqCy5ZWMF48";
var eventList = null;

router.get('/', (req, res, next) => {
    request({
        url: url,
        json: true
    }, function (error, responce, body) {
        if(!error && responce.statusCode === 200) {
            eventList = body.values;
            res.status(200).json({
                message: 'all list of the events',
                menu: eventList
            });
        }
    });
});

router.post('/', (req, res, next) => {
    res.status(201).json({
        message: 'new event was created'
    });
    request({
        url: url,
        json: true
    }, function (error, responce, body) {
        if(!error && responce.statusCode === 200) {
            clubList = body.values;
            res.status(200).json({
                message: 'new event was created',
                menu: clubList
            });
        }
    });
});

router.get('/:event', (req, res, next) => {
    const id = req.params.event;
    res.status(200).json({
        message: 'event is here!',
        id: id
    });
});

router.patch('/:event', (req, res, next) => {
    const id = req.params.event;
    res.status(200).json({
        message: 'event infos updared!',
        id: id
    });
});

router.delete('/:event', (req, res, next) => {
    const id = req.params.event;
    res.status(200).json({
        message: 'eventId deleted!',
        id: id
    });
});

module.exports = router;
