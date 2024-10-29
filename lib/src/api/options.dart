/// Future updates will support JSDoc (maybe)


/// Options for parsing the JavaScript files
class ParserOptions {

}

// class GeneratorOptions {

// }

/// Options for configuring how the library exports and source code is transformed
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
}

class TypeScriptOptions {
  /// The path to the `tsconfig.json` file used for typescript configuration
  ///
  /// Defaults to searching the current project directory for one
  String? tsConfig;
}

enum JSInteropAPI {
  legacy,
  extensionType
}