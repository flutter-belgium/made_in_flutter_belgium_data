import 'dart:io';

import 'package:api_validate/src/validation/developer/validate_profile_picture.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

enum DeveloperImageType {
  profilePicture('profile_picture.webp');

  final String fileName;

  const DeveloperImageType(this.fileName);
}

Future<void> validateDeveloperImages(
    Developer developer, String workingDirPath, Directory itemDir) async {
  if (developer.images != null) {
    throw ArgumentError(
      '${developer.githubUserName} has configured images.\n\n'
      'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/developers',
    );
  }
  developer.images = await _getImages(workingDirPath, itemDir, developer);
}

Future<DeveloperImages> _getImages(
  String workingDirPath,
  Directory itemDir,
  Developer developer,
) async {
  final profilePictureUrl =
      await getProfilePictureUrlForGithubUserName(developer.githubUserName);
  return DeveloperImages(
    profilePictureUrl: profilePictureUrl,
  );
}
