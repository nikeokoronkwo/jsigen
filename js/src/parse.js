/**
 * @module Parser
 */

const fs = require("node:fs");
const parser = require('@babel/parser');
/// <reference types="@types/babel__traverse" />
const traverse = require('@babel/traverse').default;

/**
 * @typedef {Object} ParseOptions Options for parsing JS files for configuration
 * @prop {boolean} [typescript] Whether the given file is a typescript file
 * @prop {boolean} [jsx] Whether the given file uses jsx
 */

/**
 * 
 * @param {string} source
 * @param {ParseOptions} options  
 */
function parse(source, options) {
    /** plugins to pass to babel for parsing js code */
    const plugins = ['classProperties'];
    if (options.typescript) plugins.push('typescript');
    if (options.jsx) plugins.push('jsx', 'flow');

    const ast = parser.parse(code, {
        sourceType: 'module',
        plugins,
    })
}

function parseFile() {}

exports.parse = parse;
exports.parseFile = parseFile;
