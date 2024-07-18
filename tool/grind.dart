import 'dart:convert';
import 'dart:io';

import 'package:cli_pkg/cli_pkg.dart' as pkg;
import 'package:grinder/grinder.dart';
import 'package:path/path.dart' as p;

main(args) {
  pkg.humanName.value = "JSIgen";
  pkg.executables.value = {"jsigen": "bin/jsigen.dart"};
  pkg.npmPackageJson.fn = () => json.decode(File("js/package.json").readAsStringSync())
          as Map<String, dynamic>;

  pkg.addStandaloneTasks();
  pkg.addNpmTasks();
  return grind(args);
}

final buildDir = Directory("build/npm");

@Task('Test the JS package')
@Depends("pkg-js-dev")
void js_test() {
  print("JS package test");
}

@Task('Copy the JS package files')
void copyJs() {
  print("Copying JS package files");
  final dir = Directory("js");
  
  for (final file in dir.listSync()) {
    if (p.basenameWithoutExtension(file.path) != "package") {
      if (file is Directory) {
        copyDirectory(file, Directory(p.join(buildDir.path, p.basename(file.path))));
      } else {
        copyFile(file as File, buildDir);
      }
    }
    
  }
}

@Task('Run the JS package manager and install dependencies')
void runYarn() {
  run('yarn', workingDirectory: buildDir.path);
}

@Task('Build the dev package')
@Depends("pkg-npm-dev", copyJs, runYarn)
void dev() {
  
}

@Task('Build the release package')
@Depends("pkg-npm-release")
void release() {

}
