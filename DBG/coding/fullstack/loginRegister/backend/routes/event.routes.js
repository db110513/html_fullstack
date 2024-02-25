const router = require("express").Router();
const EventController = require('../controller/event.controller');
const Event = require('../models/event.model');

router.get('/events', function(req, res, next) {
    Event.find({}).then(async function(events) {
        res.json(events); 
    }).catch(next);
}); 

router.delete('/delEvent/:id', function(req, res, next) {
    Event.findOneAndDelete(
        {_id : req.params.id})
        .then(async function (event) {
            res.json(event);
        }).catch(next);
});

router.post("/postEvent", EventController.createEvent);
router.get('/getEventList', EventController.getEventList);


router.patch('/patEvent/:id', async(req, res) => {
    try {
        const id = req.params.id;
    const event = await Event.findOneAndUpdate({_id : id}, req.body, {new : true});
        console.log(event);
        res.json({user : event});
        res.send('Event updated');
    } 
    catch (e) {
        console.log(e.message);
        res.send('Something went wrong.');
    }
});

router.put('/putEvent/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const event = await Event.findOneAndReplace({_id : id}, req.body, {new : true});
        console.log(event);
        res.json({user: event});
        res.send('Event updated');
    } 
    catch (e) {
        console.log(e.message);
        res.send('Something went wrong.');
    }
});

module.exports = router;