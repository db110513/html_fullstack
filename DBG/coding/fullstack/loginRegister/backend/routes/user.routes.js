const router = require("express").Router();
const UserController = require('../controller/user.controller');
const User = require('../models/user.model');

router.get('/users', function(req, res, next) {
    User.find({}).then(async function(users) {
        res.json(users); 
    }).catch(next);
});

router.delete('/delUser/:id', function(req, res, next) {
    User.findOneAndDelete(
        {_id : req.params.id})
        .then(async function(user) {
            res.json(user);
        }).catch(next);
});

router.post("/login", UserController.login);
router.post("/postUser", UserController.regUser);

router.patch('/patUser/:id', async(req, res) => {
    try {
        const id = req.params.id;
    const user = await User.findOneAndUpdate({_id : id}, req.body, {new : true});
        console.log(user);
        res.json({user});
        res.send('User updated');
    } 
    catch (e) {
        console.log(e.message);
        res.send('Something went wrong...');
    }
});

router.put('/putUser/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const user = await User.findOneAndReplace({_id : id}, req.body, {new : true});
        console.log(user);
        res.json({user});
        res.send('User updated');
    } 
    catch (e) {
        console.log(e.message);
        res.send('Something went wrong...');
    }
});


module.exports = router;