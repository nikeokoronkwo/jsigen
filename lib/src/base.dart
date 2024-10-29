import 'package:jsigen/src/parser/parser.dart';
import 'package:jsigen/src/transformer/transformer.dart';
import 'package:node_io/node_io.dart';

runJsigen(Map<String, dynamic> config, Directory cwd) async {
  // get input file

  // convert to output file
  final dartFile = await generateDartWrapper(cwd, config: config);

  // write output file
  await writeOutput(dartFile);
}

writeOutput(dartFile) {
}
