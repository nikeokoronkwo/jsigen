import 'package:grinder/grinder.dart';

import 'dart:io';
import 'package:path/path.dart' as p;
import 'utils.dart';


@Task('Copy the JS package files')
void copyJs() {
  print("Copying JS package files");
  final dir = Directory("js");
  
  for (final file in dir.listSync()) {
    if (["package.json", ".pnp.cjs", ".pnp.loader.mjs"].contains(p.basename(file.path)) && [".yarn"].contains(p.dirname(file.path))) {
      if (file is Directory) {
        copyDirectory(file, Directory(p.join(npmDir.path, p.basename(file.path))));
      } else {
        copyFile(file as File, npmDir);
      }
    }
    
  }
}

@Task('Run the JS package manager and install dependencies')
void runYarn() {
  run('yarn', workingDirectory: npmDir.path);
}
