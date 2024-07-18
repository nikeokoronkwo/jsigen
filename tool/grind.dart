import 'package:cli_pkg/cli_pkg.dart' as pkg;
import 'package:grinder/grinder.dart';

main(args) {
  pkg.humanName.value = "JSIgen";
  pkg.executables.value = {"jsigen": "bin/jsigen.dart"};

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
@Depends("pkg-npm-dev")
void dev() {
  
}

@Task('Build the release package')
void release() {

}
