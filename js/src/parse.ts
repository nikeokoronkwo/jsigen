/**
 * @module Parser
 */

import fs from "node:fs";
import parser from '@babel/parser';
/// <reference types="@types/babel__traverse" />
import traverse from '@babel/traverse';
import { Declaration, Identifier, TSTypeAnnotation } from "@babel/types";
import { FunctionNode, ParameterNode } from "./nodes";

interface ParseOptions {
  /** Whether typescript is allowed */
  typescript?: boolean;
  jsx?: boolean;
  filename?: string;
  flow?: boolean;
}

const defaultParseOptions = {}

// class ParserResult {
//   items: object[]
// }

/**
 * 
 * @param {import("@babel/types").Declaration} declaration 
 * @param {string} exportType 
 */
function handleDeclaration(declaration: Declaration, exportType: string) {
  let exportInfo = {
    type: exportType,
    name: declaration.id ? declaration.id.name : 'default',
    kind: 'unknown',
  };

  let exp = [];

  console.log(declaration);

  switch (declaration.type) {
    case "FunctionDeclaration":
      exp.push({
        type: "function",
        name: declaration.id?.name ?? declaration.id?.loc?.identifierName,
        parameters: declaration.params.map((p) => {
          // debug
          console.log(`========PARAMETER=======\n`)
          console.log(p)
          console.log(`\n=====================`)
          // debug end

          switch (p.type) {
            case "Identifier":
            case "AssignmentPattern":
            case "ArrayPattern":
            case "ObjectPattern":
            case "RestElement":
          }
        })
      });
      break;
    case "VariableDeclaration":
      exp.push({
        // TODO: Remove the 'd' when done
        d: declaration.declarations.map(d => {
          console.log(d)
        })
      })
    case "ClassDeclaration":
    case "ExportAllDeclaration":
    case "ExportDefaultDeclaration":
    case "ExportNamedDeclaration":
    case "ImportDeclaration":
    case "DeclareClass":
    case "DeclareFunction":
    case "DeclareInterface":
    case "DeclareModule":
    case "DeclareModuleExports":
    case "DeclareTypeAlias":
    case "DeclareOpaqueType":
    case "DeclareVariable":
    case "DeclareExportDeclaration":
    case "DeclareExportAllDeclaration":
    case "InterfaceDeclaration":
    case "OpaqueType":
    case "TypeAlias":
    case "EnumDeclaration":
    case "TSDeclareFunction":
    case "TSInterfaceDeclaration":
    case "TSTypeAliasDeclaration":
    case "TSEnumDeclaration":
    case "TSModuleDeclaration":
  }
}

/**
 * Parses the given JavaScript/TypeScript source code and returns AST information concerning the public APIs used
 * @module Parser
 * @param {string} source
 * @param {ParseOptions} [options]  
 */
export function parse(source: string, options: ParseOptions = defaultParseOptions) {
    /** plugins to pass to babel for parsing js code @type {parser.ParserPlugin[]} */
    const plugins: parser.ParserPlugin[] = ['classProperties'];
    if (options.typescript) plugins.push('typescript');
    if (options.jsx) plugins.push('jsx', 'flow');

    const ast = parser.parse(source, {
        sourceType: 'module',
        plugins,
        sourceFilename: options.filename,
    });

    const exports = [];

    // Traverse the AST to find export declarations
    traverse(ast, {
      ExportNamedDeclaration(path) {
        if (path.node.declaration) {
          const { declaration } = path.node;
          handleDeclaration(declaration, 'NamedExport');
          if (declaration.id) {
            exports.push({
              type: 'NamedExport',
              name: declaration.id.name,
              kind: declaration.kind, // "const", "let", "var", "function", etc.
            });
          } else if (declaration.declarations) {
            declaration.declarations.forEach((decl) => {
              exports.push({
                type: 'NamedExport',
                name: decl.id.name,
                kind: declaration.kind,
              });
            });
          }
        }
      },
      ExportDefaultDeclaration(path) {
        exports.push({
          type: 'DefaultExport',
          name: path.node.declaration.name || 'default',
        });
      },
      ExportAllDeclaration(path) {
        exports.push({
          type: 'ReExport',
          source: path.node.source.value,
        });
      },
    });

    return exports;
}

/**
 * Parses the file at the given path and returns AST information concerning the public APIs used
 * @module Parser
 * @param {string} filename
 * @param {ParseOptions} options
 */
function parseFile(filename: string, options: ParseOptions) {
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
