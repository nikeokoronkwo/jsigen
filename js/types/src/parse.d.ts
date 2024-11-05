/**
 * @module Parser
 */
import { ParseOptions } from "./types/ParseOptions";
interface ParseResult {
    exports: Record<string, object>;
}
/**
 * Parses the given JavaScript/TypeScript source code and returns AST information concerning the public APIs used
 */
export declare function parse(source: string, options?: ParseOptions): ParseResult;
/**
 * Parses the file at the given path and returns AST information concerning the public APIs used
 * @module Parser
 * @param {string} filename
 * @param {ParseOptions} options
 */
export declare function parseFile(filename: string, options: ParseOptions): ParseResult;
export {};
