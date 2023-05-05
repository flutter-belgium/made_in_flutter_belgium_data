import 'dart:convert';
import 'dart:io';

import 'package:api_validate/src/validation/developer/validate_project_developer.dart';
import 'package:api_validate/src/validation/project/validate_projects_images.dart';
import 'package:api_validate/src/validation/project/validate_projects_links.dart';
import 'package:api_validate/src/validation/validate_dir.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:path/path.dart';

Future<List<Project>> validateProjects(String workingDirPath, List<Company> companies) async {
  final dir = join('api', 'projects');
  final projectsApiDir = Directory(join(workingDirPath, dir));
  if (!projectsApiDir.existsSync()) {
    projectsApiDir.createSync(recursive: true);
  }
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
      await validateProjectDevelopers(project);
      await validateProjectLinks(project);
      final projectsDir = Directory(join(dir, project.name));
      if (!projectsDir.existsSync()) {
        projectsDir.createSync(recursive: true);
      }
      final projectFile = File(join(workingDirPath, projectsDir.path, 'info.json'));
      projectFile.writeAsStringSync(jsonEncode(project));
      return project;
    },
  );
  final sortedProjects = projects..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  writeProjectsToFile(sortedProjects, projectsApiDir, 'all');
  writeProjectsToFile(sortedProjects.where((element) => element.publisher != null).toList(), projectsApiDir, 'professional');
  writeProjectsToFile(sortedProjects.where((element) => element.publisher == null).toList(), projectsApiDir, 'personal');
  final minimizedProject = sortedProjects.map((e) => e.toProjectMinimized()).toList();
  writeMinimizedProjectsToFile(minimizedProject, projectsApiDir, 'minimized_all');
  writeMinimizedProjectsToFile(minimizedProject.where((element) => element.publisher != null).toList(), projectsApiDir, 'minimized_professional');
  writeMinimizedProjectsToFile(minimizedProject.where((element) => element.publisher == null).toList(), projectsApiDir, 'minimized_personal');
  return sortedProjects;
}

void writeProjectsToFile(List<Project> projects, Directory projectDirectory, String fileName) {
  final fullFileName = '$fileName.json';
  final projectsInfoFile = File(join(projectDirectory.path, fullFileName));
  projectsInfoFile.writeAsStringSync(jsonEncode(projects));
  print('$fullFileName is saved successfully 💙💙!');
}

void writeMinimizedProjectsToFile(List<MinimizedProject> projects, Directory projectDirectory, String fileName) {
  final fullFileName = '$fileName.json';
  final projectsInfoFile = File(join(projectDirectory.path, fullFileName));
  projectsInfoFile.writeAsStringSync(jsonEncode(projects));
  print('$fullFileName is saved successfully 💙💙!');
}
