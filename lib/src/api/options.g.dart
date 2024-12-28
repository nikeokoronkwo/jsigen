// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// ExtensionTypeGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
@_i1.JS('ParserOptions')
extension type JSParserOptions.p(_i1.JSObject _) implements _i1.JSObject {
  external JSParserOptions.fromJS(_i1.JSObject opts);
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
@_i1.JS('TransformerOptions')
extension type JSTransformerOptions.t(_i1.JSObject _) implements _i1.JSObject {
  external JSTransformerOptions({
    bool? defaultParameters,
    bool? weakAnonymousObjects,
    bool? weakAnonymousFunctions,
    _i1.JSArray<_i1.JSString> onlyGetters,
    bool? constructorFunctions,
  });

  external JSTransformerOptions.fromJS(_i1.JSObject opts);

  external bool? get defaultParameters;
  external bool? get weakAnonymousObjects;
  external bool? get weakAnonymousFunctions;
  external _i1.JSArray<_i1.JSString> get onlyGetters;
  external bool? get constructorFunctions;
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
@_i1.JS('TypeScriptOptions')
extension type JSTypeScriptOptions.t(_i1.JSObject _) implements _i1.JSObject {
  external JSTypeScriptOptions({String? tsConfig});

  external JSTypeScriptOptions.fromJS(_i1.JSObject opts);

  external String? get tsConfig;
}
