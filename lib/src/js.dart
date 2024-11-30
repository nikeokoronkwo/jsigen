import "dart:js_interop";

import "package:jsigen/src/api/api.dart";
import "package:jsigen/src/api/config.dart";

@JS()
@staticInterop
class _Exports {
  
}

@JS()
extension _JS on _Exports {
  external set parse(JSFunction function);
  external set parseModule(JSFunction function);
  external set generate(JSFunction function);
  external set generateModule(JSFunction function);
}

@JS()
external _Exports get exports;

void main() {
  exports.parse = parse.toJS as JSFunction;
  exports.parseModule = parseModule.toJS as JSFunction;
  exports.generate = generate.toJS as JSFunction;
  exports.generateModule = generateModule.toJS as JSFunction;
}