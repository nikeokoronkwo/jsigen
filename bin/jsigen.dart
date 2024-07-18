import 'package:args/args.dart';

final parser = ArgParser(allowTrailingOptions: true)
  ..addFlag('help', abbr: 'h', help: 'Show this help message and exit.')
  ..addFlag('version', abbr: 'v', help: 'Show version information and exit.')
  ..addOption('output', abbr: 'o', help: 'Output file path.')
  ..addOption('config', abbr: 'c', help: 'Config file path.');

void main(List<String> args) {
  final result = parser.parse(args);

  if (result.wasParsed('help')) {
    print(parser.usage);
    return;
  }

  if (result.wasParsed('version')) {
    print('0.0.1');
    return;
  }

  print(result.rest);
}