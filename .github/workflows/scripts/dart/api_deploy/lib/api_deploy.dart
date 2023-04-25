import 'dart:io';

import 'package:api_deploy/src/writor/build_api_dir.dart';
import 'package:api_deploy/src/writor/build_api_projects.dart';
import 'package:path/path.dart';

Future<void> apiDeploy() async {
  final workingDirPath = join(Directory.current.path, '..', '..', '..', '..', '..');
  await buildApiFolder(workingDirPath);
  await buildApiProjectsFolder(workingDirPath);
}
