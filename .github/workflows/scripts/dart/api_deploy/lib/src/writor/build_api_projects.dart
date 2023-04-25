import 'dart:io';

import 'package:path/path.dart';

Future<void> buildApiProjectsFolder(String workingDirPath) async {
  final apiDir = Directory(join(workingDirPath, 'api', 'projects'));
  if (!apiDir.existsSync()) {
    apiDir.createSync(recursive: true);
  }
}