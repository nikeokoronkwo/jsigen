export interface ParseOptions {
  /** Whether typescript is allowed */
  typescript?: boolean;
  jsx?: boolean;
  filename?: string;
  flow?: boolean;
}

export const defaultParseOptions = {}