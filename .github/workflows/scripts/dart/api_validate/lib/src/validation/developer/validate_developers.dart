import 'dart:convert';
import 'dart:io';

import 'package:api_validate/src/validation/developer/validate_developer_images.dart';
import 'package:api_validate/src/validation/developer/validate_developer_links.dart';
import 'package:api_validate/src/validation/validate_dir.dart';
import 'package:api_validate/src/writor/list_writor.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:path/path.dart';

Future<List<Developer>> validateDevelopers(String workingDirPath) async {
  final developers = await validateDir(
    workingDirPath,
    'developers',
    'Developer',
    (data, itemDir) async {
      final developer = Developer.fromJson(data);
      final baseName = basename(itemDir.path);
      if (baseName != developer.githubUserName) {
        throw ArgumentError(
          '${developer.githubUserName} has an invalid name. (directory and githubUserName in info.json should be the same)\n\n'
          'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/developers',
        );
      }
      await validateDeveloperImages(developer, workingDirPath, itemDir);
      await validateDeveloperLinks(developer);
      return developer;
    },
  );
  return developers..sort((a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
}

Future<void> saveDevelopersToApi(List<Developer> developers, String workingDirPath) async {
  final dir = join('api', 'developers');
  final developersApiDir = Directory(join(workingDirPath, dir));
  if (!developersApiDir.existsSync()) {
    developersApiDir.createSync(recursive: true);
  }
  for (final developer in developers) {
    final developerPath = join(developersApiDir.path, developer.githubUserName);
    final developerDir = Directory(developerPath);
    if (!developerDir.existsSync()) {
      developerDir.createSync(recursive: true);
    }
    final developerInfoFile = File(join(developerPath, 'info.json'));
    developerInfoFile.writeAsStringSync(jsonEncode(developer));
  }
  writeListToFile(developers, developersApiDir, 'all');
  final minimizedProject = developers.map((e) => e.toMinimizedDeveloper()).toList();
  writeListToFile(minimizedProject, developersApiDir, 'minimized_all');
}
