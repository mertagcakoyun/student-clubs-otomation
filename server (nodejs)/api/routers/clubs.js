const express = require('express');
const router = express.Router();

router.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*")
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
    next()
})

router.get('/', (req, res, next) => {
    res.status(200).json({
        message: 'all list of the student clubs'
    });
});

router.post('/', (req, res, next) => {
    res.status(201).json({
        message: 'new student club was created'
    });
});

router.get('/:club', (req, res, next) => {
    const id = req.params.club;
    if (id === 'yna') {
        res.status(200).json({
            message: 'Here we are, the YNA!',
            id: id
        });
    } else {
        res.status(200).json({
            message: 'it is just eh!'
        });
    }
});

router.patch('/:club', (req, res, next) => {
    const id = req.params.club;
    res.status(200).json({
        message: 'club infos updared!',
        id: id
    });
});

router.delete('/:club', (req, res, next) => {
    const id = req.params.club;
    res.status(200).json({
        message: 'club deleted!',
        id: id
    });
});

module.exports = router;