import 'dart:io';

import 'package:api_validate/utils/validate_companies.dart';
import 'package:api_validate/utils/validate_projects.dart';
import 'package:path/path.dart';

Future<void> apiValidate() async {
  final workingDirPath = join(Directory.current.path, '..', '..', '..', '..', '..');
  final workingDir = Directory(workingDirPath);
  print(workingDir.path);
  print(workingDir.existsSync());
  print(workingDir.listSync().length);
  // await validateCompanies(workingDirPath);
  await validateProjects(workingDirPath);
}
