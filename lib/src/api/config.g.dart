// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// ExtensionTypeGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
@_i1.JS('Config')
extension type JSConfig.c(_i1.JSObject _) implements _i1.JSObject {
  external JSConfig({
    String? name,
    String? description,
    String? preamble,
    String path,
    String? output,
    String? interopApi,
    JSParserOptions? parserOptions,
    JSTransformerOptions? transformerOptions,
    _i1.JSArray<_i1.JSString> exclude,
    bool typescript,
    bool jsx,
    JSTypeScriptOptions? typeScriptOptions,
    bool module,
  });

  external JSConfig.fromJS(_i1.JSObject config);

  external String? get name;
  external String? get description;
  external String? get preamble;
  external bool get module;
  external String get path;
  external String? get output;
  external String? get interopApi;
  external JSParserOptions? get parserOptions;
  external JSTransformerOptions? get transformerOptions;
  external _i1.JSArray<_i1.JSString> get exclude;
  external bool get typescript;
  external bool get jsx;
  external JSTypeScriptOptions? get typeScriptOptions;
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
@_i1.JS('ModuleConfig')
extension type JSModuleConfig.m(_i1.JSObject _) implements JSConfig {
  external JSModuleConfig();

  external bool get module;
  external bool? get outputAsDir;
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
@_i1.JS('FileConfig')
extension type JSFileConfig.f(_i1.JSObject _) implements JSConfig {
  external JSFileConfig();

  external bool get module;
}
