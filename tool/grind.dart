import 'dart:convert';
import 'dart:io';

import 'package:cli_pkg/cli_pkg.dart' as pkg;
import 'package:grinder/grinder.dart';
import 'package:path/path.dart';

import 'grind/js.dart';
import 'grind/utils.dart';

export 'grind/js.dart';

main(args) {
  pkg.humanName.value = "JSIgen";
  pkg.executables.value = {"jsigen": "bin/jsigen.dart"};
  pkg.npmPackageJson.fn = () => json.decode(File("js/package.json").readAsStringSync())
          as Map<String, dynamic>;
  pkg.jsForceStrictMode.value = true;
  pkg.jsEsmExports.value = {
    'parse',
    'generate',
    'parseModule',
    'generateModule'
  };
  pkg.jsRequires.value = [
    pkg.JSRequire('./src/parse.js', target: pkg.JSRequireTarget.all, identifier: 'parser')
  ];
  pkg.npmReadme.value = File("js/README.md").readAsStringSync();
  pkg.jsModuleMainLibrary.value = "lib/src/js.dart";

  pkg.addStandaloneTasks();
  pkg.addNpmTasks();
  return grind(args);
}

@Task('Test the JS package')
@Depends("pkg-js-dev")
void js_test() {
  print("JS package test");
}

@Task('Build the dev package')
@Depends("pkg-npm-dev", copyJs, runpnpm)
void dev() {
  // run('pnpm', arguments: ['dev'], workingDirectory: npmDir.path);
}

@Task('Build the release package')
@Depends("pkg-npm-release")
void release() {
  
}

@Task('Update the version ')
void version() {
  run('dart', arguments: ['scripts/version.dart']);
}
