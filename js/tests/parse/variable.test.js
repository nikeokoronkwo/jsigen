import { expect, test } from 'vitest'
import { parse } from "../../src/parse";

test("Test for variable parsing", () => {
  const code = `
  export const foo = 9;

  export var mama = () => 900;

  let mee = 9;
  export default mee;

  `

  console.log(parse(code, {
    typescript: true
  }));
})
