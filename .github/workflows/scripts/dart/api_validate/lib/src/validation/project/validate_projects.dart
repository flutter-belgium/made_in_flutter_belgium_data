import 'dart:convert';
import 'dart:io';

import 'package:api_validate/src/validation/developer/validate_project_developer.dart';
import 'package:api_validate/src/validation/project/validate_projects_images.dart';
import 'package:api_validate/src/validation/project/validate_projects_links.dart';
import 'package:api_validate/src/validation/validate_dir.dart';
import 'package:api_validate/src/writor/list_writor.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:path/path.dart';

Future<List<Project>> validateProjects(
    String workingDirPath, List<Company> companies) async {
  final projects = await validateDir(
    workingDirPath,
    'projects',
    'Project',
    (data, itemDir) async {
      final project = Project.fromJson(data);
      final baseName = basename(itemDir.path);
      if (baseName != project.name) {
        throw ArgumentError(
          '${project.name} has an invalid name. (directory and name in info.json should be the same)\n\n'
          'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
        );
      }
      validateProjectImages(project, companies, workingDirPath, itemDir);
      await validateProjectDeveloper(project);
      await validateProjectLinks(project);
      return project;
    },
  );
  return projects
    ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
}

Future<void> saveProjectsToApi(
    List<Project> projects, String workingDirPath) async {
  final dir = join('api', 'projects');
  final projectsApiDir = Directory(join(workingDirPath, dir));
  for (final project in projects) {
    final projectsDir = Directory(join(dir, project.name));
    if (!projectsDir.existsSync()) {
      projectsDir.createSync(recursive: true);
    }
    final projectFile =
        File(join(workingDirPath, projectsDir.path, 'info.json'));
    projectFile.writeAsStringSync(jsonEncode(project));
  }
  writeListToFile(projects, projectsApiDir, 'all');
  writeListToFile(
      projects.where((element) => element.publisher != null).toList(),
      projectsApiDir,
      'professional');
  writeListToFile(
      projects.where((element) => element.publisher == null).toList(),
      projectsApiDir,
      'personal');
  final minimizedProject = projects.map((e) => e.toMinimizedProject()).toList();
  writeListToFile(minimizedProject, projectsApiDir, 'minimized_all');
  writeListToFile(
      minimizedProject.where((element) => element.publisher != null).toList(),
      projectsApiDir,
      'minimized_professional');
  writeListToFile(
      minimizedProject.where((element) => element.publisher == null).toList(),
      projectsApiDir,
      'minimized_personal');
}
