import 'dart:convert';

// TODO: Add support for deno apis
import 'package:jsigen/src/base.dart';
import 'package:node_io/node_io.dart'
  if (dart.library.io) 'dart:io';

import 'package:args/args.dart';

import 'package:jsigen/src/cli.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

final parser = ArgParser(allowTrailingOptions: true)
  ..addFlag('help', abbr: 'h', help: 'Show this help message and exit.')
  ..addFlag('version', abbr: 'v', help: 'Show version information and exit.')
  ..addOption('output', abbr: 'o', help: 'Output file path.')
  ..addOption('config', abbr: 'c', help: 'Config file path.');

void main(List<String> args) async {
  final result = parser.parse(args);

  if (result.wasParsed('help')) {
    print(parser.usage);
    return;
  }

  if (result.wasParsed('version')) {
    print(version);
    return;
  }

  print('1');

  String? arg = result.rest.isNotEmpty ? result.rest[0] : null;

  // parse config file
  Directory cwd = Directory(arg ?? '.');

  print('1');


  File configFile = File(p.join(cwd.absolute.path, result['config'] ?? 'jsigen.yaml'));
  String configAsString;
  if (await configFile.exists()) {
    configAsString = await configFile.readAsString();
  } else {
    String pubspec = await File(p.join(cwd.absolute.path, 'pubspec.yaml')).readAsString();
    final pub = loadYaml(pubspec)['jsigen'].toString();

    if (pub == 'null' || pub == '') {
      throw Exception('No config file/definition found');
    } else {
      configAsString = pub;
    }
  }

  print('1');


  Map<String, dynamic> config = loadYaml(configAsString);

  // run jsigen
  await runJsigen(config, cwd);

  print('1');


  // parse file
  
}