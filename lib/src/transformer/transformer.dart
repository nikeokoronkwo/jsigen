import 'package:jsigen/src/api/config.dart';
import 'package:jsigen/src/parser/parser.dart';
import 'package:node_io/node_io.dart';
import 'package:path/path.dart';

generateDartWrapper(Directory cwd, {required Config config}) async {
  final jsFile = await parseJsFile(cwd, config: config);
}

parseJsFile(Directory cwd, {required Config config}) {
  return parseFile(
    isAbsolute(config.path) ? config.path : join(cwd.path, config.path)
  );
}
