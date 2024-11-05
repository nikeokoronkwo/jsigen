import "dart:js_interop";

import "package:jsigen/src/api/config.dart";

@JS()
@staticInterop
class _Exports {
  
}

@JS()
extension _JS on _Exports {
  external set sayHello(JSFunction function);
}

@JS()
external _Exports get exports;

void main() {
  exports.sayHello = (() => print("Hello, world!")).toJS as JSFunction;
}