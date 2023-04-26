import 'dart:convert';
import 'dart:io';

import 'package:api_validate/utils/validate_projects.dart';
import 'package:path/path.dart';

Future<void> buildApiProjectsFolder(String workingDirPath) async {
  final dir = join('api', 'projects');
  final file = join(dir, 'all.json');
  final projectsApiDir = Directory(join(workingDirPath, dir));
  if (!projectsApiDir.existsSync()) {
    projectsApiDir.createSync(recursive: true);
  }
  final projects = await validateProjects(workingDirPath);

  final sortedProjects = projects..sort((a, b) => a.name.compareTo(b.name));
  final projectsFile = File(join(workingDirPath, file));
  projectsFile.writeAsStringSync(jsonEncode(sortedProjects));
  print('$file is saved successfully 💙💙!');
}
