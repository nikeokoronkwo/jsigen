# Using JSIGen
JSIGen can be used in many ways. JSIGen can be used to generate dart files from a set of js files or bundle all of the exports from the js file into a single dart file.

## Getting Started
To get started, you will need to have a JavaScript Runtime installed.
To use this in `node`:
```bash

```

## Using
By default JSIGen bundles all exports from JS Files into a single dart file, specified by the `out` option in the JSIGen configuration.
<!-- TODO: Add example -->

To generate files for every js file produced, you will need to enable the `multiple` option.
<!-- TODO: Add example -->

You can also specify the kind of extensions these files should have with the `outExtension` option. By default, it will convert all JS/TS extensions from `.js` to `.g.dart`.
<!-- TODO: Add example -->

In future releases, we plan to provide the option of mapping inputs to output.

There are many more options possible, and you can take a look at all of them [here](./config.md).

## Dart Client API
It is also possible to interface with JSIGen client apis, which can be used for configuring many things about JSIGen 

You can make use of annotations and builders which can be used to enabling interop with specific files.

```dart
@JSImport('index.js')
library;

import 'index.g.dart';

// more code...
```