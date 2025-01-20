import 'dart:io';

import 'package:path/path.dart' as path;

String readJson(String name) {
  final currentDirectory = Directory.current;
  final testDirectory = currentDirectory.path.endsWith('/test')
      ? currentDirectory.parent
      : currentDirectory;

  final filePath = path.join(testDirectory.path, 'test', name);
  return File(filePath).readAsStringSync();
}
