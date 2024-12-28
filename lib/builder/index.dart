import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import './class_gen.dart';

Builder jsBuilder(BuilderOptions options) => PartBuilder(
      [ExtensionTypeGenerator()], '.g.dart'
);
