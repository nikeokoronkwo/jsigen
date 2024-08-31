import 'package:code_builder/code_builder.dart';

class JSIVariable {
  String name;
  String type;
  bool lambda;

  JSIVariable({
    required this.name,
    required this.type,
    this.lambda = false
  });
}

List<Method> buildVariable(JSIVariable variable) {
  // variables in JS are converted to get and set, unless they are constant

  return [
    Method((m) => m
      ..annotations.add(CodeExpression(Code("JS()")))
      ..name = variable.name
      ..external = true
      ..type = MethodType.getter
      ..returns = refer(variable.type)
    ), Method((m) => m
      ..annotations.add(CodeExpression(Code("JS()")))
      ..name = "Fee"
      ..external = true
      ..type = MethodType.setter
      ..returns = refer('void')
      ..requiredParameters.add(
        Parameter((p) => p
          ..name = "value"
          ..type = refer(variable.type)
        )
      )
    )
  ];
}