import 'dart:convert';
import 'dart:io';

import 'package:api_validate/utils/validate_dir.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:path/path.dart';

const _allowedImageFolder = [
  'screenshots',
];

Future<void> validateProjects(String workingDirPath) async {
  final dir = join('api', 'projects');
  final projectsApiDir = Directory(join(workingDirPath, dir));
  if (!projectsApiDir.existsSync()) {
    projectsApiDir.createSync(recursive: true);
  }
  final projects = await validateDir(
    workingDirPath,
    'projects',
    'Project',
    (data, itemDir) {
      final project = Project.fromJson(data);
      final baseName = basename(itemDir.path);
      if (baseName != project.name) {
        throw ArgumentError(
          '${project.name} has an invalid name. (directory and name in info.json should be the same)\n\n'
          'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
        );
      }
      if (project.images != null) {
        throw ArgumentError(
          '${project.name} has configured images.\n\n'
          'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
        );
      }
      project.images = _getImages(workingDirPath, itemDir, project);
      return project;
    },
  );

  final file = join(dir, 'all.json');
  final sortedProjects = projects..sort((a, b) => a.name.compareTo(b.name));
  final projectsFile = File(join(workingDirPath, file));
  projectsFile.writeAsStringSync(jsonEncode(sortedProjects));
  print('$file is saved successfully 💙💙!');
}

ProjectImages? _getImages(
  String workingDirPath,
  Directory itemDir,
  Project project,
) {
  final screenshotLinks = <String>[];
  String? appIconUrl;
  String? bannedUrl;

  final imagesDir = Directory(join(itemDir.path, 'assets', 'img'));
  if (!imagesDir.existsSync()) {
    throw ArgumentError(
      '${project.name} has no `assets/img` directory added.\n\n'
      'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
    );
  }
  for (final imageFile in imagesDir.listSync()) {
    final fileName = basename(imageFile.path);
    if (imageFile is Directory) {
      if (!_allowedImageFolder.contains(fileName)) {
        throw ArgumentError(
          '${project.name} has invalid folder in the image folder ($fileName).\n\n'
          'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
        );
      }
      screenshotLinks.addAll(_getScreenshots(imageFile));
    } else if (imageFile is File) {
      final imageUrl = 'https://api.madein.flutterbelgium.be/projects/${project.name}/images/$fileName';
      final dir = Directory(join(workingDirPath, 'api', 'projects', project.name, 'images'));
      if (!dir.existsSync()) {
        dir.createSync(recursive: true);
      }
      imageFile.copySync(join(dir.path, fileName));
      if (fileName == ProjectImageType.appIcon.fileName) {
        appIconUrl = imageUrl;
      } else if (fileName == ProjectImageType.banner.fileName) {
        bannedUrl = imageUrl;
      } else {
        throw ArgumentError(
          '${project.name} has invalid images in the image folder ($fileName).\n\n'
          'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
        );
      }
    } else {
      throw ArgumentError('${project.name} has invalid file type: accepted, file/directory -> ($imageFile).');
    }
  }
  if (appIconUrl == null) {
    throw ArgumentError(
      '${project.name} has no app_icon.webp file.\n\n'
      'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
    );
  }
  return ProjectImages(
    appIconUrl: appIconUrl,
    bannerUrl: bannedUrl,
    screenshotUrls: screenshotLinks,
  );
}

List<String> _getScreenshots(Directory imageFile) => [];

enum ProjectImageType {
  appIcon('app_icon.webp'),
  banner('banner.webp');

  final String fileName;

  const ProjectImageType(this.fileName);
}
