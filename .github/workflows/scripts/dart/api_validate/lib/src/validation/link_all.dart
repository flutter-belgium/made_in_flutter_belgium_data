import 'package:collection/collection.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<void> setLinkedProjects(
  List<Project> projects,
  List<Company> companies,
  List<Developer> developers,
) async {
  await _setInvolvedCompaniesToProjects(projects, companies);
  await _setLinkedProjectsToCompanies(projects, companies);
  await _setLinkedProjectsToDevelopers(projects, developers);
}

Future<void> _setLinkedProjectsToCompanies(List<Project> projects, List<Company> companies) async {
  for (final company in companies) {
    final companyName = company.name;
    if (company.projects != null) throw ArgumentError('Company `$companyName` already has projects configured. This is not allowed.');
    final projectsForCompany = projects.where((e) => e.publisher == companyName).toList();
    final involvedProjectsForCompany = projects.where((e) {
      final involvedCompanies = e.involvedCompanies;
      if (involvedCompanies == null) return false;
      return involvedCompanies.any((company) => company.name == companyName);
    }).toList();
    company.projects = projectsForCompany.map((e) => e.toMinimizedProject()).toList();
    company.involvedProjects = involvedProjectsForCompany.map((e) => e.toMinimizedProject()).toList();
  }
}

Future<void> _setInvolvedCompaniesToProjects(List<Project> projects, List<Company> companies) async {
  for (final project in projects) {
    final projectName = project.name;
    if (project.involvedCompanies != null) throw ArgumentError('Project `$projectName` already has involvedCompanies configured. This is not allowed.');
    final involvedCompanies = <Company>{};
    final developers = project.developers;
    if (developers == null) continue;
    for (final developer in developers) {
      final companyNameForDeveloper = developer.companyName;
      if (companyNameForDeveloper == null) continue;
      final company = companies.firstWhereOrNull((e) => e.name == companyNameForDeveloper);
      if (company == null) continue;
      involvedCompanies.add(company);
    }
    project.involvedCompanies = involvedCompanies.map((e) => e.toMinimizedCompany()).toList();
  }
}

Future<void> _setLinkedProjectsToDevelopers(List<Project> projects, List<Developer> developers) async {
  for (final developer in developers) {
    if (developer.projects != null) throw ArgumentError('Developer `${developer.githubUserName}` already has projects configured. This is not allowed.');
    final projectsForDeveloper = projects.where((project) {
      final projectDevelopers = project.developers;
      if (projectDevelopers == null) return false;
      return projectDevelopers.any((projectDeveloper) => projectDeveloper.githubUserName == developer.githubUserName);
    }).toList();
    developer.projects = projectsForDeveloper.map((e) => e.toMinimizedProject()).toList();
  }
}
