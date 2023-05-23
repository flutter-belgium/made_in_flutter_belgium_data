import 'dart:io';

import 'package:collection/collection.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:path/path.dart';

const _allowedImageFolder = [
  'screenshots',
];

enum ProjectImageType {
  appIcon('app_icon.webp'),
  banner('banner.webp');

  final String fileName;

  const ProjectImageType(this.fileName);
}

void validateProjectImages(Project project, List<Company> companies,
    String workingDirPath, Directory itemDir) {
  if (project.images != null) {
    throw ArgumentError(
      '${project.name} has configured images.\n\n'
      'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
    );
  }
  final companyForProject = companies
      .firstWhereOrNull((element) => element.name == project.publisher);
  project.images =
      _getImages(workingDirPath, itemDir, project, companyForProject);
}

ProjectImages _getImages(
  String workingDirPath,
  Directory itemDir,
  Project project,
  Company? company,
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
  final dir = Directory(
      join(workingDirPath, 'api', 'projects', project.name, 'images'));
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
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
      screenshotLinks.addAll(_getScreenshotsUrls(project, imageFile, dir));
    } else if (imageFile is File) {
      final imageUrl =
          'https://api.madein.flutterbelgium.be/projects/${project.name}/images/$fileName';
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
      throw ArgumentError(
          '${project.name} has invalid file type: accepted, file/directory -> ($imageFile).');
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
    companyLogoUrl: company?.images?.logoUrl,
  );
}

List<String> _getScreenshotsUrls(
    Project project, Directory imageFile, Directory dir) {
  final screenshots = <String>[];
  var hasImages = true;
  do {
    final fileName = 'screenshot_${screenshots.length + 1}.webp';
    final screenshotImage = File(join(imageFile.path, fileName));
    if (screenshotImage.existsSync()) {
      final imageUrl =
          'https://api.madein.flutterbelgium.be/projects/${project.name}/images/$fileName';
      screenshots.add(imageUrl);
      screenshotImage.copySync(join(dir.path, fileName));
    } else {
      hasImages = false;
    }
  } while (hasImages);
  return screenshots;
}
