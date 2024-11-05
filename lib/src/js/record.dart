import 'dart:js_interop';

import 'object.dart';

extension type JSRecord<T extends JSAny, K extends JSAny>._(JSObject o) implements JSObject {
  external K operator [](T index);
  external void operator []=(T index, K value);
}

extension on Map {
  JSRecord get toJsMap => fromEntries(entries.map((e) => [e.key, e.value]).toList().jsify() as JSArray);
}