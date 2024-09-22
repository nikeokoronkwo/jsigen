import { expect, test } from 'vitest'
import { parse } from "../src/parse";

test.todo("Test for Typescript file")

test.todo("Test for plain javascript file")

test.todo("Test for JavaScript file with JSDoc")

test.todo("Test for actual files in example folder")

test('produces ', () => {
  const code = `
  export function add(a?: number, b: number = 9): number {
    return a + b;
  }

  export async function subtract(a: number, b: number): Promise<number> {
    return a + b;
  }

  export function* water(...i: Array<number>) {
    for (const num in i) {
      yield i;  
    }
  }

  export function myFunc<T>(a: T): Promise<T> {
  
  }
  `

  console.log(parse(code, {
    typescript: true
  }));
});
