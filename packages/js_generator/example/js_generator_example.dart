import 'package:code_builder/code_builder.dart';
import 'package:js_generator/js_generator.dart';

void main() {
  final str = '''
@JSExport()
class A {
  int a = 9;

  int get b => a;
  set b(int newB) {
    a = newB;
  }
}
''';
  final constructor = Constructor((c) => c
    ..optionalParameters.addAll([
      Parameter((p) => p
      ..name = 'fee'
      ..required = true
      ),
      Parameter((p) => p
      ..name = 'feel'
      ..required = false
      ),
      Parameter((p) => p
      ..name = 'feed'
      ..required = true
      ..named = true
      ),
      Parameter((p) => p
      ..name = 'feem'
      ..required = false
      ..named = true
      ),
    ])
    ..requiredParameters.addAll([
      Parameter((p) => p
      ..name = 'foo'
      ..required = true
      ),
      Parameter((p) => p
      ..name = 'fool'
      ..required = false
      ),
      Parameter((p) => p
      ..name = 'food'
      ..required = true
      ..named = true
      ),
      Parameter((p) => p
      ..name = 'foom'
      ..required = false
      ..named = true
      ),
    ])
  );
  final classs = Class((c) => c
  ..name = 'CCC'
  ..constructors.add(constructor)
  );
  print(classs.accept(DartEmitter()));
}
