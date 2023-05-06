import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:collection/collection.dart';

Future<void> validateAll(List<Project> projects, List<Company> companies) async {
  await _validateProjectsLinkedToCompanies(projects, companies);
  await _validateCompaniesLinkedToProjects(projects, companies);
}

Future<void> _validateProjectsLinkedToCompanies(List<Project> projects, List<Company> companies) async {
  final activePublisher = <Company>{};
  for (final project in projects) {
    print('🔎 `${project.name}` start validation');
    if (project.publisher == null) {
      print('💻 `${project.name}` has no publisher, This app is probably developed by a kickass solo developer!\n'
          'Take a look at the developer list instead! `${project.name} will be marked as personal project.\n'
          'Add the correct publisher to show the app in the non personal projects list!');
      continue;
    }
    final companyForProject = companies.firstWhereOrNull((element) => element.name == project.publisher);
    if (companyForProject == null) {
      throw ArgumentError('Company `${project.publisher}` not found for project `${project.name}` in the list of companies');
    }
    activePublisher.add(companyForProject);
    print('🤍 `${project.name}` has a valid publisher!');
  }
  if (companies.length != activePublisher.length) {
    throw ArgumentError('1 or more companies are not used in any project:\n\n${companies.where((element) => !activePublisher.contains(element)).map((e) => e.name).join('\n')}');
  }
}

Future<void> _validateCompaniesLinkedToProjects(List<Project> projects, List<Company> companies) async {
  for (final company in companies) {
    final projectsForCompany = projects.where((element) => element.publisher == company.name).toList();
    if (company.projects != null) throw ArgumentError('Company `${company.name}` already has projects configured. This is not allowed.');
    company.projects = projectsForCompany.map((e) => e.toMinimizedProject()).toList();
  }
}
