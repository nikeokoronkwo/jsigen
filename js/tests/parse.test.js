import { expect, test } from 'vitest'
import { parse } from "../src/parse";

test.todo("Test for Typescript file")

test.todo("Test for plain javascript file")

test.todo("Test for JavaScript file with JSDoc")

test.todo("Test for actual files in example folder")

test('produces ', () => {
  const code = `
  export function add(a?: number, b: number = 9) {
    return a + b;
  }


  `

  console.log(parse(code, {
    typescript: true
  }));
});
