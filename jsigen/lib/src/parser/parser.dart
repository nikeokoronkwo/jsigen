@JS('parser')
import '../js/record.dart';
import 'package:node_io/node_io.dart';
import 'dart:js_interop';

@JS('ParseOptions')
extension type JSParseOptions._(JSObject o) implements JSObject {
  external JSParseOptions({
    bool typescript,
    bool jsx,
    String filename,
    bool flow,
  });
  external set typescript(bool value);
  external set jsx(bool value);
  external set filename(String value);
  external set flow(bool value);
}

@JS('ParseResult')
extension type JSParseResult._(JSObject o) implements JSObject {
  external JSParseResult({
    JSRecord exports,
  });
  external JSRecord<JSString, JSObject> get exports;
}

/// Gets the content of the entry JavaScript File from 
@JS('parse')
external JSParseResult parse(String source, [JSParseOptions? options]);

@JS('parseFile')
external JSParseResult parseFile(String filename, [JSParseOptions? options]);

// runReverseJsigen(Map<String, dynamic> config, Directory cwd) async {
//   // parse input file
//   await parseDartFile();

//   // convert to output file
//   await transformDartExports();

//   // write output file
//   await writeOutput();
// }