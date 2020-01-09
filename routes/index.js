const express = require('express');
const router = express.Router();
const dockerCommandsRepository = require('../lib/dockerCommandsRepository');

/* GET home page. */
router.get('/', function(req, res, next) {
  dockerCommandsRepository.getDockerCommands(function(err, commands) {
      res.render('index', { dockerCommands: commands });
  })
});

module.exports = router;
