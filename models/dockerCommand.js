'use strict';

const mongoose = require('mongoose'),
    Schema  = mongoose.Schema;
    
const exampleSchema = Schema({
    example     : { type: String, required: true },
    description : { type: String, required: true },
});

const dockerCommandSchema = Schema({
    command  : { type: String, required: true },
    description : { type: String, required: true },
    examples: [exampleSchema]
});

module.exports = mongoose.model('dockerCommand', dockerCommandSchema);;