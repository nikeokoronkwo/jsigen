
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart' hide FunctionType, RecordType;
import 'package:jsigen/src/annotations/index.dart';
import 'package:source_gen/source_gen.dart';


class ExtensionTypeGenerator extends GeneratorForAnnotation<JSMirror> {
  String toJSType(DartType type) {
    print("$type ${type.nullabilitySuffix.index} ${type is ParameterizedType} ${type.element?.name}");
    if (type is DynamicType) { return 'JSAny'; }
    else if (type is FunctionType || type.isDartCoreFunction) { /* TODO: Be able to type out JS functions */ return 'JSFunction'; }
    else if (type is ParameterizedType) {
      var join = type.typeArguments.map((t) => toJSType(t)).join(', ');
      if (type.isDartAsyncFuture || type.isDartAsyncFutureOr) return 'JSPromise<${join.startsWith('JS') ? '_i1.$join' : join}>';
      if (type.isDartCoreList) return 'JSArray<${join.startsWith('JS') ? '_i1.$join' : join}>';
      if (type.isDartCoreMap) {
        return 'JSObject'; // TODO: Type out Map
      } else {
        if (type.isDartCoreBool || type.isDartCoreDouble || type.isDartCoreInt || type.isDartCoreString || type.isDartCoreNum || type.isDartCoreNull) return type.toString();
        if (type.nullabilitySuffix.index == 0) {
          
        }
        return 'JS' + type.toString();
      }
    } else if (type is RecordType) { /* Not supported */ return ''; }
    else if (type is TypeParameterType) { return type.element?.name ?? ''; }
    else if (type is VoidType) { return 'void'; }
    else {
      if (type.toString().endsWith('?')) {
        return 'JS' + type.toString().replaceAll('?', '');
      }
      return 'JSObject';
    }
  }

  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    // get methods and instances from the class, then recreate
    String? annotationName = annotation.peek('name')?.stringValue;
    String name = annotationName == null || annotationName.isEmpty ? element.name ?? 'Anonymous' : annotationName;

    assert(element is ClassElement, 'Only Support for Classes is available');
    ClassElement classElement = element as ClassElement;

    // rebuild extension type;
    final ext = ExtensionType((e) => e
    ..representationDeclaration = RepresentationDeclaration((r) => r
    ..name = '_'
    ..declaredRepresentationType = refer('JSObject', 'dart:js_interop'))
      ..annotations.add(
        refer('JS', 'dart:js_interop').call([literalString(name)])
      )
      ..name = 'JS$name'
      ..primaryConstructorName = name.toLowerCase()[0]
      ..implements.addAll(classElement.supertype == null ? [refer('JSObject', 'dart:js_interop')] : [refer('JS' + classElement.supertype!.element.name)])
      
      // recreate constructor
      ..constructors.addAll(
        classElement.constructors.map((con) {
          return Constructor((c) => c
          ..name = con.name.isEmpty ? null : con.name
          ..external = true
          ..requiredParameters.addAll(
            con.parameters.where((param) => param.isRequired).map((param) {
              return Parameter((p) => p
              ..name = param.name
              ..type = refer(toJSType(param.type), toJSType(param.type).startsWith('JS') ? 'dart:js_interop' : null)
              );
            })
          )
          ..optionalParameters.addAll(
            con.parameters.where((param) => param.isOptional || param.isNamed).map((param) {
              return Parameter((p) => p
              ..name = param.name
              ..type = refer(toJSType(param.type),  toJSType(param.type).startsWith('JS') ? 'dart:js_interop' : null)
              ..named = param.isNamed
              ..required = !param.isOptional
              );
            })
          )
          );
        })
      )

      ..methods.addAll(classElement.fields.map((p) {
        return Method((f) => f
        ..name = p.name
        ..returns = refer(toJSType(p.type),  toJSType(p.type).startsWith('JS') ? 'dart:js_interop' : null)
        ..external = true
        ..static = p.isStatic
        ..type = MethodType.getter
        );
      }))

      ..methods.addAll(classElement.methods.map((m) {
        return Method((p0) => p0
        ..name = m.name
        ..returns = refer(toJSType(m.returnType),  toJSType(m.returnType).startsWith('JS') ? 'dart:js_interop' : null)
        ..external = true
        ..modifier = (() {
          if (m.isSynchronous) {
            return MethodModifier.syncStar;
          } else if (m.isAsynchronous) {
            if (m.isGenerator) return MethodModifier.asyncStar; 
            return MethodModifier.async;
          } else {
            return null;
          }
        })()
        ..static = m.isStatic
        ..types.addAll(m.typeParameters.map((m) => refer(m.toString())))
        // ..type = (() {
        //   if 
        // })()
        ..requiredParameters.addAll(
            m.parameters.where((param) => param.isRequired).map((param) {
              return Parameter((p) => p
              ..name = param.name
              ..type = refer(toJSType(param.type),  toJSType(param.type).startsWith('JS') ? 'dart:js_interop' : null)
              );
            })
          )
          ..optionalParameters.addAll(
            m.parameters.where((param) => param.isOptional || param.isNamed).map((param) {
              return Parameter((p) => p
              ..name = param.name
              ..type = refer(toJSType(param.type),  toJSType(param.type).startsWith('JS') ? 'dart:js_interop' : null)
              ..named = param.isNamed
              ..required = !param.isOptional
              );
            })
          )
        );
      }))
    );

    final lib = Library((l) => l..body.add(ext));

    return '''
    ${'${lib.accept(DartEmitter.scoped())}'.replaceAll("import 'dart:js_interop' as _i1;", '')}
    ''';
  }
  
}