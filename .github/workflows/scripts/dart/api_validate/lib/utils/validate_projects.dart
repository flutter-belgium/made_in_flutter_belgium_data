import 'dart:io';

import 'package:path/path.dart';

Future<void> validateProjects(String workingDirPath) async {
  final projectsDirectory = Directory(join(workingDirPath, 'projects'));
  if (!projectsDirectory.existsSync()) throw ArgumentError('projects directory not found');
}
