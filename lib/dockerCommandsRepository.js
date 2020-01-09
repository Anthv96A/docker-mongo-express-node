'use strict';

const DockerCommand = require('../models/dockerCommand');

const dockerCommandsRepository = function() {

    const getDockerCommands = function(callback) {
        DockerCommand.find(function(err, commands) {
            if (err) return callback(err, null);

            callback(err, extractData(commands));
        });
    };

    return { getDockerCommands };

    function extractData(commands){
        const extractedCmds = commands.map(c => { 
            const examples = c._doc.examples.map(e => { return { example: e.example, description: e.description}});
            c._doc.examples = [ ...examples];
            return c._doc;
         });
        return extractedCmds;
    }
}();

module.exports = dockerCommandsRepository;