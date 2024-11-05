/**
 * @module Parser
 */

import fs from "node:fs";
import parser from '@babel/parser';
/// <reference types="@types/babel__traverse" />
import traverse from '@babel/traverse';
import { Declaration, Identifier, TSTypeAnnotation } from "@babel/types";
import { FunctionNode, ParameterNode } from "./nodes";
import { ParseOptions, defaultParseOptions } from "./types/ParseOptions";

interface ParseResult {
  exports: Record<string, object>;
}

/**
 * 
 * @param {import("@babel/types").Declaration} declaration 
 * @param {string} exportType 
 */
function handleDeclaration(declaration: Declaration, exportType: string) {

  switch (declaration.type) {
    case "FunctionDeclaration":
    case "VariableDeclaration":
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
 */
export function parse(source: string, options: ParseOptions = defaultParseOptions): ParseResult {
    // parse source code
    
    // get exports

    // generate exports

    // return export objects
    return {
      exports: {}
    }
}

/**
 * Parses the file at the given path and returns AST information concerning the public APIs used
 * @module Parser
 * @param {string} filename
 * @param {ParseOptions} options
 */
export function parseFile(filename: string, options: ParseOptions) {
    const source = fs.readFileSync(filename, 'utf8');
    options = {...options, ...{
        filename,
        typescript: filename.endsWith('.ts') || filename.endsWith(".tsx"),
        jsx: filename.endsWith('.jsx') || filename.endsWith(".tsx"),
    }}
    return parse(source, options);
}

