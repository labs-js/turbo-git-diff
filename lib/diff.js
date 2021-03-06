#!/usr/bin/env node

module.exports = (args='') => {
    const exec = require('child_process').exec,
          path = require('path'),
          diffPath = path.join(__dirname, './diff.sh');

    exec(`sh ${diffPath} ${args}`,
        (error, stdout, stderr) => {
            console.log(`${stdout}`);
            console.log(`${stderr}`);
            if (error !== null) {
                console.log(`exec error: ${error}`);
            }
        });
};
