
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:js_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';
import 'dart:js_interop' show JSExport;

class ExtensionTypeGenerator extends GeneratorForAnnotation<JSExport> {
  String toJsType(DartType type) {
    if (type.isDartCoreFunction) return 'JSFunction';
    else if (type.isDartAsyncFuture || type.isDartAsyncFutureOr) return 'JSPromise';
    else return deduceType(type.toString());
  }

  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    // get methods and instances from the class, then recreate
    String annotationName = annotation.read('name').stringValue;
    String name = annotationName.isEmpty ? element.name ?? 'Anonymous' : annotationName;

    assert(element is ClassElement, 'Only Support for Classes is available');
    ClassElement classElement = element as ClassElement;

    // rebuild extension type;
    final generator = ExtensionType((e) => e
      ..annotations.add(
        refer('JS').call([literalString(name)])
      )
      ..name = 'JS$name'
      ..primaryConstructorName = name.toLowerCase()[0]
      ..implements.add(refer('JSObject', 'dart:js_interop'))
      
      // recreate constructor
      ..constructors.addAll(
        classElement.constructors.map((con) {
          return Constructor((c) => c
          ..name = con.name
          ..external = true
          ..requiredParameters.addAll(
            con.parameters.where((param) => param.isRequired).map((param) {
              return Parameter((p) => p
              ..name = param.name
              ..type = refer(toJsType(param.type))
              );
            })
          )
          ..optionalParameters.addAll(
            con.parameters.where((param) => param.isOptional || param.isNamed).map((param) {
              return Parameter((p) => p
              ..name = param.name
              ..type = refer(toJsType(param.type))
              ..named = param.isNamed
              ..required = !param.isOptional
              );
            })
          )
          );
        })
      )
    );
  }
  
}