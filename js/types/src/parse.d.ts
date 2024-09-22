/**
 * @module Parser
 */
interface ParseOptions {
    /** Whether typescript is allowed */
    typescript?: boolean;
    jsx?: boolean;
    filename?: string;
    flow?: boolean;
}
/**
 * Parses the given JavaScript/TypeScript source code and returns AST information concerning the public APIs used
 * @module Parser
 * @param {string} source
 * @param {ParseOptions} [options]
 */
export declare function parse(source: string, options?: ParseOptions): any[];
export {};
