import 'package:api_validate/utils/validate_projects.dart';

Future<void> buildApiProjectsFolder(String workingDirPath) async {
  await validateProjects(workingDirPath);
}
