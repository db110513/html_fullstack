const db = require('../config/db');
const mongoose = require('mongoose');
const UserModel = require('./user.model')
const { Schema } = mongoose;

const EventSchema = new Schema({
    userId: {
        type: String,
        required: [true, "ID can't be empty"],
        unique: true,
    },
    name: {
        type: String,
        required: [true, "event name can't be empty"],
    },
    desc: {
        type: String,
        required: [true, "desc is required"],
    },
    eventDate: {
        type: String,
        required: [true, "eventDate can't be empty"],
        unique: true,
    },
    pic: {
        type: String,
        required: [true, "pic can't be empty"],
        unique: true,
    },
    price: {
        type: Number,
        required: [true, "price can't be empty"],
    },
},{timestamps:true});


const EventModel = db.model('event', EventSchema);
module.exports = EventModel;