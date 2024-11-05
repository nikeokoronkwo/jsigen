import 'dart:js_interop';

String deduceType(String T) {
  final builtIn = [num, int, String, bool];
  if (builtIn.contains(T)) {
    return T;
  }
  return switch (T) {
    'Function' => 'JSFunction',
    'List' => 'JSArray',
    'Iterable' => 'JSArray',
    _ => 'JSObject'
  };
}