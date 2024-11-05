import 'dart:js_interop';


@JS('Object.fromEntries')
external JSObject _fromEntries(JSArray iterable);
T fromEntries<T extends JSObject>(JSArray iterable) => _fromEntries(iterable) as T;