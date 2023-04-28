import 'dart:io';

import 'package:api_validate/validation/validate_all.dart';
import 'package:api_validate/validation/company/validate_companies.dart';
import 'package:api_validate/validation/project/validate_projects.dart';
import 'package:path/path.dart';

Future<void> apiValidate() async {
  final workingDirPath = join(Directory.current.path, '..', '..', '..', '..', '..');
  final companies = await validateCompanies(workingDirPath);
  print('💙 All companies are valid!!');
  final projects = await validateProjects(workingDirPath, companies);
  print('💙 All projects are valid!!');
  await validateAll(projects, companies);
  print('💙 All companies are linked to 1 or more projects!!');
}
