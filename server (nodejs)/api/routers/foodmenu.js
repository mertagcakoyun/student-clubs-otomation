const express = require('express');
const router = express.Router();

router.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*")
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
    next()
})

router.get('/', (req, res, next) => {
    res.status(200).json({
        message: 'here is the food menu',
        menu: {
            "01.11.2018": {
                0: {
                    type: "çorba",
                    name: "Ezogelin Çorbası",
                    kcal: 149
                },
                1: {
                    type: "ana yemek",
                    name: "Hasanpaşa Köfesi",
                    kcal: 317
                },
                2: {
                    type: "ana yemek",
                    name: "Paylıcan Sote",
                    kcal: 215
                },
                3: {
                    type: "ana yemek",
                    name: "Bulgur Pilavı",
                    kcal: 291
                },
                4: {
                    type: "meze",
                    name: "Acılı Ezme",
                    kcal: 160
                },
                5: {
                    type: "cacık",
                    name: "Cacık",
                    kcal: 127
                }
            },
            "02.11.2018": {
                0: {
                    type: "çorba",
                    name: "Tarhana Çorbası",
                    kcal: 180
                },
                1: {
                    type: "ana yemek",
                    name: "Tavuk Kavurma",
                    kcal: 340
                },
                2: {
                    type: "ana yemek",
                    name: "Fesleğenli Patates Graten",
                    kcal: 294
                },
                3: {
                    type: "ana yemek",
                    name: "Makarna",
                    kcal: 310
                },
                4: {
                    type: "salata",
                    name: "Yeşil Salata",
                    kcal: 123
                },
                5: {
                    type: "tatlı",
                    name: "Çikolatalı Muhallebi",
                    kcal: 233
                }
            }
        }
    });
});

router.post('/', (req, res, next) => {
    res.status(201).json({
        message: 'food menu was created!'
    });
});

router.patch('/', (req, res, next) => {
    res.status(200).json({
        message: 'food menu edited!'
    });
});

module.exports = router;