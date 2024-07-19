# The JSIGen Docs

## Why JS Package
As of the current release of JSIGen, there isn't a suitable parser and analyzer 

## How does it work?
The `jsigen` tool works by converting the public APIs in your JavaScript Code to Dart JavaScript interoperability calls, which can work both on the web and on the server (if you are compiling for Node). In order to do this, `jsigen` has to go through the following steps:
- Getting Configuration: `jsigen` gets the configuration for your given project, in order to configure parsing and generating the code. This configuration is as a `jsigen.config.yaml` file by default, but can be specified with a different name or directory with the `--config` option. Configuration is tested and validated using [`pkl`]
- Parsing: `jsigen` then parses the provided code, which is either a single file producing a single output, or a set of files, either parsed from the command or stated in the configuration file. The JS parser is implemented in JavaScript, and ported to Dart via the Dart-JS Interop API.
    The JS API acts as a simple abstractio
- Type Checking
- Code Generation
- Compilation