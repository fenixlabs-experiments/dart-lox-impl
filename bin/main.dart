import 'dart:io';

import 'package:dart_lox_impl/src/error_reporter.dart';
import 'package:dart_lox_impl/src/scanner.dart';

void main(List<String> arguments) {
  if (arguments.length > 1) {
    stderr.writeln('Usage: dartlox [<path>]');
  } else if (arguments.length == 1) {
    _runFile(arguments[0]);
  } else {
    _runPrompt();
  }
}

int _run(String source) {
  final errorReporter = ErrorReporter();
  final tokens = Scanner(source, errorReporter).scanTokens();

  for (var token in tokens) {
    print(token);
  }

  final code = errorReporter.hadError ? 65 : 0;
  return code;
}

void _runFile(String path) {
  try {
    exitCode = _run(File(path).readAsString());
  } on FileSystemException {
    stderr.writeln('Could not open file: $path');
  }
}

void _runPrompt() {
  for (;;) {
    stdout.write('dartlox> ');
    _run(stdin.readLineSync());
  }
}
