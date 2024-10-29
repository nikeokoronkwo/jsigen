/// TODO: Require
/// TODO: Dynamic Imports
import 'package:jsigen/src/api/options.dart';

/// The JSIGen Configuration Object
/// 
/// The configuration object is used for JavaScript files and JavaScript Libraries
sealed class Config {
  /// The name of the config
  String? name;

  /// Description for the JSIGen configuration
  String? description;

  /// The preamble to be placed in the file before the given generated code
  String? preamble;

  /// Whether the given configuration is a module or not
  /// 
  /// Used because of direct extraction from YAML
  /// Defaults to `false`
  bool module;

  /// The path to the file or module
  String path;

  /// The path to the output of the generated file or module
  /// 
  /// Defaults to the same name of the produced file 
  String? output;

  /// Whether to use the [Extension Types API](https://dart.dev/interop/js-interop/usage) or fallback to the [legacy JS Interop API](https://dart.dev/interop/js-interop/past-js-interop)
  /// 
  /// If not provided, JSIGen uses the Dart Version of your project to deduce the suitable interop API to use 
  JSInteropAPI? interopApi;

  /// Parser options
  ParserOptions? parserOptions;

  /// Transformer options 
  /// 
  /// These options deal with how the JavaScript file APIs are transformed and how the Dart APIs are, therefore, generated
  TransformerOptions? transformerOptions;

  /// Files to exclude from 
  List<String> exclude;

  /// Whether typescript is used in this project
  bool typescript;

  /// Whether JSX is used in this project
  bool jsx;
}


final class ModuleConfig extends Config {
  @override
  bool module = true;

  /// whether the given module or library output should be produced as separate files (`true`) or as a single file otherwise
  /// 
  /// EXPERIMENTAL: This flag does not work at the moment
  bool? outputAsDir;
}

final class FileConfig extends Config {
  @override
  bool module = false;
}
