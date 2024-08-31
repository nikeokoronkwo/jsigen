import 'package:code_builder/code_builder.dart';

buildFunction(JSIFunction function) {
  return Method((m) => m
  ..name = function.name,
  );
}

class JSIFunction {
  String name;

  JSIFunction({
    required this.name
  });
}