import 'package:jsigen/src/api/config.dart';
import 'package:jsigen/src/api/result.dart';
import 'package:jsigen/src/js/record.dart';
import 'package:jsigen/src/parser/parser.dart';
import 'package:node_io/node_io.dart';
import 'package:path/path.dart';

/// Function for generating the dart wrapper for JS
generateDartWrapper(Directory cwd, {required Config config}) async {
  final jsExports = await parseJsFile(cwd, config: config);
  final dartBindings = await generateDartBindings(jsExports, config: config);

  return dartBindings;
}

/// Generates the dart bindings from the JS bindings
generateDartBindings(ParseResult jsExports, {required Config config}) {
  // TODO: Implement
}

Future<ParseResult> parseJsFile(Directory cwd, {required Config config}) async {
  final res = parseFile(
    isAbsolute(config.path) ? config.path : join(cwd.path, config.path)
  );
  // TODO: Convert JS Parse Result to Res
  return ParseResult();
}
