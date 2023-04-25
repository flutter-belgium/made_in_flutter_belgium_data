import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<void> buildApiProjectsFolder(String workingDirPath) async {
  final projectsDir = Directory(join(workingDirPath, 'projects'));
  final projectsApiDir = Directory(join(workingDirPath, 'api', 'projects'));
  if (!projectsApiDir.existsSync()) {
    projectsApiDir.createSync(recursive: true);
  }
  final projects = <Project>[];

  for (final dir in projectsDir.listSync()) {
    if (dir is! Directory) continue;
    final dirSegments = dir.uri.pathSegments;
    final projectName = dirSegments[dirSegments.length - 2];
    print('Project: `$projectName` start writing');
    final infoJsonFile = File(join(dir.path, 'info.json'));
    final infoJsonString = await infoJsonFile.readAsString();
    final project = Project.fromJson(jsonDecode(infoJsonString) as Map<String, dynamic>);
    projects.add(project);
  }
  final sortedProjects = projects..sort((a, b) => a.name.compareTo(b.name));
  final projectsFile = File(join(projectsApiDir.path, 'all.json'));
  projectsFile.writeAsStringSync(jsonEncode(sortedProjects));
  print('api/projects/all.json is saved successfully 💙💙!');
}
