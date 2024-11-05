import 'dart:js_interop';

import 'object.dart';

extension type JSRecord<T extends JSAny, K extends JSAny>._(JSObject o) implements JSObject {
  external K operator [](T index);
  external void operator []=(T index, K value);
  // Map get toDartMap => Map.fromIterables(keys(o).dartify() as Iterable, values(o).dartify() as Iterable);
}

extension Dartify<T extends JSAny, K extends JSAny> on JSRecord<T, K> {
  Map get toDartMap => Map.fromIterables(keys<T>(this).dartify() as Iterable, values<K>(this).dartify() as Iterable);
}


extension on Map {
  JSRecord get toJsMap => fromEntries(entries.map((e) => [e.key, e.value]).toList().jsify() as JSArray);
}