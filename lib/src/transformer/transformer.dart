import 'package:jsigen/src/parser/parser.dart';
import 'package:node_io/node_io.dart';

generateDartWrapper(Directory cwd, {required Map<String, dynamic> config}) async {
  final jsFile = await parseJsFile(cwd, config: config);
}
