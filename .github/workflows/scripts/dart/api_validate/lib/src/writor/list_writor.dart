import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

void writeListToFile<T>(List<T> projects, Directory projectDirectory, String fileName) {
  final fullFileName = '$fileName.json';
  final baseName = basename(projectDirectory.path);
  final projectsInfoFile = File(join(projectDirectory.path, fullFileName));
  projectsInfoFile.writeAsStringSync(jsonEncode(projects));
  print('$fullFileName is saved successfully in ($baseName)💙💙!');
}
