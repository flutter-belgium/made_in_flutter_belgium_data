import 'package:api_validate/src/model/api_validation_data.dart';
import 'package:api_validate/src/validation/validate_all.dart';
import 'package:api_validate/src/validation/company/validate_companies.dart';
import 'package:api_validate/src/validation/project/validate_projects.dart';

Future<ApiValidationData> apiValidate(String workingDirPath) async {
  final companies = await validateCompanies(workingDirPath);
  print('💙 All companies are valid!!');
  final projects = await validateProjects(workingDirPath, companies);
  print('💙 All projects are valid!!');
  await validateAll(projects, companies);
  print('💙 All companies are linked to 1 or more projects!!');
  await saveCompaniesToApi(companies, workingDirPath);
  return ApiValidationData(
    companies: companies,
    projects: projects,
  );
}
