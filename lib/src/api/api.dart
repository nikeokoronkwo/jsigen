library jsigen.api;

import 'package:jsigen/src/api/config.dart';

/// Parses a js file and generates the JS API AST from it needed for the given project
/// 
/// If a declaration has an object type, this object type is added in a [Set] and is generated as an anonymous object 
/// 
/// If a declaration has a function type, this object type is added in a [Set] and used as either a class or typealias
parse(String file, JsigenConfig config) {

}


/// Generates and returns the Dart Code from a given file
/// 
/// ## Variables
/// Variables are generated as getter/setter pairs
/// 
/// ## Functions
/// Functions are generated as ordinary function types
/// 
/// ### Default Parameters
/// Default parameters are either re-interfaced, or they are converted to optional parameters
/// 
/// ### Optional Parameters
/// Optional parameters 
/// 
/// ## Anonymous Objects
/// Anonymous objects are generated into anonymous JS interop classes using `@anonymous` and `@JS` if using old interop, and an extension type with braces used in the constructor definition if using new interop
/// 
/// ## Classes
/// Classes are converted into classes in old interop and extension types in new interop
/// 
generate(String file, JsigenConfig config) {
  
}