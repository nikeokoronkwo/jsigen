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
 * @prop {string} [filename] The name of the file being parsed
 * @prop {boolean} [flow] Whether the given file uses Facebook Flow
 */

/**
 * Parses the given JavaScript/TypeScript source code and returns AST information concerning the public APIs used
 * @module Parser
 * @param {string} source
 * @param {ParseOptions} options  
 */
function parse(source, options) {
    /** plugins to pass to babel for parsing js code */
    const plugins = ['classProperties'];
    if (options.typescript) plugins.push('typescript');
    if (options.jsx) plugins.push('jsx', 'flow');

    const ast = parser.parse(source, {
        sourceType: 'module',
        plugins,
        sourceFilename: options.filename,
    });
}

/**
 * Parses the file at the given path and returns AST information concerning the public APIs used
 * @module Parser
 * @param {string} filename
 * @param {ParseOptions} options
 */
function parseFile(filename, options) {
    const source = fs.readFileSync(filename, 'utf8');
    options = {...options, ...{
        filename,
        typescript: filename.endsWith('.ts') || filename.endsWith(".tsx"),
        jsx: filename.endsWith('.jsx') || filename.endsWith(".tsx"),
    }}
    return parse(source, options);
}

exports.parse = parse;
exports.parseFile = parseFile;
