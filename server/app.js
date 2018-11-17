const express = require('express');
const app = express();

const foodMenuRouters = require('./api/routers/foodmenu');
const clubsRouters = require('./api/routers/clubs');
const eventsRouters = require('./api/routers/events');

app.use('/foodmenu', foodMenuRouters);
app.use('/clubs', clubsRouters);
app.use('/events', eventsRouters);

module.exports = app;