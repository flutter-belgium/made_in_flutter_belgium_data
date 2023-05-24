import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

void writeListToFile<T, E>(
  List<T> list,
  Directory projectDirectory,
  String fileName,
  E Function(T item) toMinimizedItem,
) {
  _writeListToFile(list, projectDirectory, fileName);
  _writeListToFile(list.map((e) => toMinimizedItem(e)).toList(),
      projectDirectory, 'minimized_$fileName');
}

void _writeListToFile<T, E>(
  List<T> list,
  Directory projectDirectory,
  String fileName,
) {
  final fullFileName = '$fileName.json';
  final baseName = basename(projectDirectory.path);
  final projectsInfoFile = File(join(projectDirectory.path, fullFileName));
  projectsInfoFile.writeAsStringSync(jsonEncode(list));
  print('$fullFileName is saved successfully in ($baseName)💙💙!');
}
