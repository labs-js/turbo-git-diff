#!/usr/bin/env node
(function() {
    'use strict';
    var exec = require('child_process').exec,
        path = require('path'),
        diffPath = path.join(__dirname, './diff.sh');

    exec(`sh ${diffPath}`,
        (error, stdout, stderr) => {
            console.log(`${stdout}`);
            console.log(`${stderr}`);
            if (error !== null) {
                console.log(`exec error: ${error}`);
            }
        });
})();
