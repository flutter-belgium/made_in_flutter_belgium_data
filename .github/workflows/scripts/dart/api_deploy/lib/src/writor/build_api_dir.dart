import 'dart:io';

import 'package:path/path.dart';

Future<void> buildApiFolder(String workingDirPath) async {
  final apiDir = Directory(join(workingDirPath, 'api'));
  if (!apiDir.existsSync()) {
    apiDir.createSync(recursive: true);
  }
  await _createIndexHtml(apiDir);
}

Future<void> _createIndexHtml(final Directory apiDir) async {
  final indexHtmlFile = File(join(apiDir.path, 'index.html'));
  indexHtmlFile.writeAsStringSync('Api under construction');
}
