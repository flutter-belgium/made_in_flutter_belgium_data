import 'dart:io';

import 'package:api_validate/utils/validate_companies.dart';
import 'package:api_validate/utils/validate_projects.dart';
import 'package:path/path.dart';

Future<void> apiValidate() async {
  final workingDirPath = join(Directory.current.path, '..', '..', '..', '..', '..');
  await validateCompanies(workingDirPath);
  print('💙 All companies are valid!!');
  await validateProjects(workingDirPath);
  print('💙 All projects are valid!!');
}
