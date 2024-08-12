import { expect, test } from 'vitest'
import { parse } from "../src/parse";

test('produces ', () => {
  const code = `
  /** @returns {number} */
  export function add(a, b) {
    return a + b;
  }
  `

  console.log(parse(code));
});
