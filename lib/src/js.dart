import "dart:js_interop";

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