import 'dart:io';

import 'package:api_deploy/src/diff_util.dart';
import 'package:api_deploy/src/repo/api_repository.dart';
import 'package:api_deploy/src/writor/build_api_dir.dart';
import 'package:api_validate/api_validate.dart';
import 'package:path/path.dart';

Future<void> apiDeploy() async {
  try {
    // final apiCompanies = await getCompanies();
    // final apiProjects = await getProjects();
    final workingDirPath =
        join(Directory.current.path, '..', '..', '..', '..', '..');
    await buildApiFolder(workingDirPath);
    final apiValidateData = await apiValidate(workingDirPath);
    // await checkForNewProjects(apiProjects, apiValidateData.projects);
    // await checkForNewCompanies(apiCompanies, apiValidateData.companies);
    print('💙💙 Deploy completed successfully!! 💙💙');
  } catch (e) {
    if (e is ArgumentError) {
      print('\nError: ${e.message}\n');
      exit(-1);
    } else {
      rethrow;
    }
  }
}
