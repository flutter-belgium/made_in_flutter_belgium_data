import 'dart:io';

import 'package:api_validate/utils/validate_companies.dart';
import 'package:api_validate/utils/validate_projects.dart';
import 'package:path/path.dart';

Future<void> apiValidate() async {
  final workingDir = join('..', '..', '..', '..', '..', Directory.current.path);
  await validateCompanies(workingDir);
  await validateProjects(workingDir);
}
