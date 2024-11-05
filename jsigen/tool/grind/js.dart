import 'package:grinder/grinder.dart';

import 'dart:io';
import 'package:path/path.dart' as p;
import 'utils.dart';


@Task('Copy the JS package files')
@Depends(buildDist)
void copyJs() {
  print("Copying JS package files");
  final dir = Directory("js");
  
  for (final file in dir.listSync()) {
    if (!["package.json", ".DS_Store", "tsconfig.json", "out", "node_modules", "src", "types", "tests", "test"].contains(p.basename(file.path))) {
      if (file is Directory) {
        copyDirectory(file, Directory(p.join(npmDir.path, p.basename(file.path))));
      } else {
        copyFile(file as File, npmDir);
      }
    }
  }
}

@Task('Copies the dist files')
@Depends(transpile)
void buildDist() {
  print("Copying JS package files");
  final dir = Directory(p.join('js', 'out'));
  
  for (final file in dir.listSync()) {
    if (file is Directory) {
      copyDirectory(file, Directory(p.join(npmDir.path, p.basename(file.path))));
    } else {
      copyFile(file as File, npmDir);
    }
  }

  dir.deleteSync(recursive: true);
}

@Task('Run the JS package manager and install dependencies')
void runpnpm() {
  run('pnpm', arguments: ['install'], workingDirectory: npmDir.path);
}


@Task('Transpile typescript source files')
void transpile() {
  Process.runSync('tsc', [], workingDirectory: 'js');
}