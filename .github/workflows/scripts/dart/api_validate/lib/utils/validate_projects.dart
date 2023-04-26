import 'dart:io';

import 'package:api_validate/utils/validate_dir.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:path/path.dart';

const _allowedImageFolder = [
  'screenshots',
];

Future<List<Project>> validateProjects(String workingDirPath) async {
  final projects = await validateDir(
    workingDirPath,
    'projects',
    'Project',
    (data, itemDir) {
      final project = Project.fromJson(data);
      if (project.images != null) {
        throw ArgumentError(
          '${project.name} has configured images.\n\n'
          'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
        );
      }
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
          if (fileName == ProjectImage.appIcon.fileName) {
            appIconUrl = imageUrl;
          } else if (fileName == ProjectImage.banner.fileName) {
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
      project.images = ProjectImages(
        appIconUrl: appIconUrl,
        bannerUrl: bannedUrl,
        screenshotsUrls: screenshotLinks,
      );
      return project;
    },
  );
  return projects;
}

List<String> _getScreenshots(Directory imageFile) => [];

enum ProjectImage {
  appIcon('app_icon.webp'),
  banner('banner.webp');

  final String fileName;

  const ProjectImage(this.fileName);
}
