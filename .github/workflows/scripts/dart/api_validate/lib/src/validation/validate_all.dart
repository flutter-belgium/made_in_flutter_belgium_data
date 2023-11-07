import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:collection/collection.dart';

Future<void> validateAll(
    List<Project> projects, List<Company> companies) async {
  await _validateProjectsLinkedToCompanies(projects, companies);
}

Future<void> _validateProjectsLinkedToCompanies(
    List<Project> projects, List<Company> companies) async {
  final activeCompanies = <Company>{};
  for (final project in projects) {
    print('🔎 `${project.name}` start validation');
    final projectPublisher = project.publisher;
    if (projectPublisher == null) {
      print(
          '💻 `${project.name}` has no publisher, This app is probably developed by a kickass solo developer!\n'
          'Take a look at the developer list instead! `${project.name} will be marked as personal project.\n'
          'Add the correct publisher to show the app in the non personal projects list!');
      continue;
    }
    final companyForProject =
        getCompanyForProject(companies, project.name, projectPublisher);
    activeCompanies.add(companyForProject);
    print('🤍 `${project.name}` has a valid publisher!');
  }

  // Add all companies that are working on a project but did not publish it. Think (agencies, freelancers, ...)
  for (final project in projects) {
    final developers = project.developers;
    if (developers == null || developers.isEmpty) continue;
    for (final developer in developers) {
      final companyNameForDeveloper = developer.companyName;
      if (companyNameForDeveloper == null) continue;
      if (project.publisher == companyNameForDeveloper) continue;
      final companyForDeveloper = getCompanyForProject(
          companies, project.name, companyNameForDeveloper);
      companyForDeveloper.isAgency = true;
      activeCompanies.add(companyForDeveloper);
    }
  }

  if (companies.length != activeCompanies.length) {
    throw ArgumentError(
        '1 or more companies are not used in any project:\n\n${companies.where((element) => !activeCompanies.contains(element)).map((e) => e.name).join('\n')}');
  }
}

Company getCompanyForProject(
  List<Company> companies,
  String projectName,
  String companyName,
) {
  final companyForProject =
      companies.firstWhereOrNull((element) => element.name == companyName);
  if (companyForProject == null) {
    throw ArgumentError(
        'Company `$companyName` not found for project `$projectName` in the list of companies');
  }
  return companyForProject;
}
