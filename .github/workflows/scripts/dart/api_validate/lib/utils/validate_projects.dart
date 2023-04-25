import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<void> validateProjects(String workingDirPath) async {
  final projectsDirectory = Directory(join(workingDirPath, 'projects'));
  if (!projectsDirectory.existsSync()) throw ArgumentError('projects directory not found');
  for (final dir in projectsDirectory.listSync()) {
    if (dir is! Directory) continue;
    final dirSegments = dir.uri.pathSegments;
    final projectName = dirSegments[dirSegments.length - 1];
    print('Project: $projectName start validation');
    final infoJsonFile = File(join(dir.path, 'info.json'));
    final infoJsonString = await infoJsonFile.readAsString();
    Project.fromJson(jsonDecode(infoJsonString) as Map<String, dynamic>);
    print('Project: $projectName has a valid info.json 💙💙!');
  }
}
