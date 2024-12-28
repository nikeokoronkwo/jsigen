import 'package:jsigen/src/annotations/index.dart';

/// Future updates will support JSDoc (maybe)
import 'dart:js_interop' as _i1;

part 'options.g.dart';

/// Options for parsing the JavaScript files
@JSMirror()
class ParserOptions {
  ParserOptions.fromJS(JSParserOptions? opts);
}

// class GeneratorOptions {

// }

/// Options for configuring how the library exports and source code is transformed
@JSMirror()
class TransformerOptions {
  /// Whether to provide default parameters for function parameters from libraries
  /// 
  /// Defaults to `false`, leaving such parameters 
  bool? defaultParameters;

  /// Whether to produce types for anonymous objects, or to leave them as anonymous objects of `JSObject` type
  /// 
  /// Defaults to `false`
  bool? weakAnonymousObjects;

  /// Whether to produce types for anonymous JS Functions, or to leave them as anonymous objects of `JSFunction` type
  /// 
  /// Defaults to `false`
  bool? weakAnonymousFunctions;

  /// List of variable APIs to treat as constants and only produce getters for
  List<String> onlyGetters;

  /// Whether to convert constructor functions to class calls or to leave them as function calls
  /// 
  /// Defaults to `false` leaving them as function calls
  bool? constructorFunctions;

  TransformerOptions({
    this.defaultParameters,
    this.weakAnonymousObjects,
    this.weakAnonymousFunctions,
    this.onlyGetters = const [],
    this.constructorFunctions,
  });

  TransformerOptions.fromJS(JSTransformerOptions? opts):
    defaultParameters = opts?.defaultParameters,
    weakAnonymousObjects = opts?.weakAnonymousObjects,
    weakAnonymousFunctions = opts?.weakAnonymousFunctions,
    onlyGetters = opts?.onlyGetters.toDart.map((m) => m.toDart).toList() ?? [],
    constructorFunctions = opts?.constructorFunctions;
}

@JSMirror()
class TypeScriptOptions {
  /// The path to the `tsconfig.json` file used for typescript configuration
  ///
  /// Defaults to searching the current project directory for one
  String? tsConfig;

  TypeScriptOptions({
    this.tsConfig,
  });

  TypeScriptOptions.fromJS(JSTypeScriptOptions? opts):
    tsConfig = opts?.tsConfig;
}


enum JSInteropAPI {
  legacy,
  extensionType;

  static JSInteropAPI? parse(String value) {
    return JSInteropAPI.values.where((a) => a.name == value).isEmpty ? null : JSInteropAPI.values.firstWhere((a) => a.name == value);
  }
}