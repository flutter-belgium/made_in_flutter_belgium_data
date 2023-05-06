import 'package:api_validate/src/model/api_validation_data.dart';
import 'package:api_validate/src/validation/developer/validate_developers.dart';
import 'package:api_validate/src/validation/link_all.dart';
import 'package:api_validate/src/validation/validate_all.dart';
import 'package:api_validate/src/validation/company/validate_companies.dart';
import 'package:api_validate/src/validation/project/validate_projects.dart';

Future<ApiValidationData> apiValidate(String workingDirPath) async {
  final companies = await validateCompanies(workingDirPath);
  print('💙 All companies are valid!!');
  final developers = await validateDevelopers(workingDirPath);
  print('💙 All developers are valid!! (Developers are not required to have all data filled in, this is up to each developer)');
  final projects = await validateProjects(workingDirPath, companies);
  print('💙 All projects are valid!!');
  await validateAll(projects, companies);
  print('💙 All companies are linked to 1 or more projects!!');
  await setLinkedProjects(projects, companies, developers);
  print('💙 All projects are linked to the correct companies & developers');
  await saveCompaniesToApi(companies, workingDirPath);
  await saveDevelopersToApi(developers, workingDirPath);
  return ApiValidationData(
    companies: companies,
    developers: developers,
    projects: projects,
  );
}
