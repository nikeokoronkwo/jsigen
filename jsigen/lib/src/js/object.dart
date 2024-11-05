import 'dart:js_interop';


@JS('Object.fromEntries')
external JSObject _fromEntries(JSArray iterable);
T fromEntries<T extends JSObject>(JSArray iterable) => _fromEntries(iterable) as T;

@JS('Object.keys')
external JSArray<T> keys<T extends JSAny>(JSObject obj);
@JS('Object.values')
external JSArray<T> values<T extends JSAny>(JSObject obj);