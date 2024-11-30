@JS('parser')
library;

import 'dart:js_interop';

@JS('parse')
external JSObject parse(String source, JSObject options);