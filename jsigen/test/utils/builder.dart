import 'package:code_builder/code_builder.dart';

extension SpecTester on Spec {
  String toTestString([bool scoped = false]) {
    return '${accept(scoped ? DartEmitter.scoped() : DartEmitter())}';
  }
}