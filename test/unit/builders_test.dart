import 'package:jsigen/src/builder/variable.dart';
import 'package:test/test.dart';

import '../utils/builder.dart';

void main() {
  test('builder should work', () {
    final variable = JSIVariable(name: "foo", type: "String");

    print(buildVariable(variable).map((v) => v.toTestString()).join("\n"));
  });
}