'use strict';

// First specs for turbo-git-diff: the package ships a shell pipeline, so the
// meaningful assertions here are structural (index exports, diff.sh present).

var fs = require('fs');
var path = require('path');

var diff = require('../index.js');

describe('turbo-git-diff', function () {
    it('exports a function taking git args', function () {
        expect(typeof diff).toBe('function');
    });

    it('ships lib/diff.sh next to the module', function () {
        var stat = fs.statSync(path.join(__dirname, '..', 'lib', 'diff.sh'));

        expect(stat.isFile()).toBe(true);
    });
});
