import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<void> setLinkedProjects(
  List<Project> projects,
  List<Company> companies,
  List<Developer> developers,
) async {
  await _setLinkedProjectsToCompanies(projects, companies);
  await _setLinkedProjectsToDevelopers(projects, developers);
}

Future<void> _setLinkedProjectsToCompanies(List<Project> projects, List<Company> companies) async {
  for (final company in companies) {
    if (company.projects != null) throw ArgumentError('Company `${company.name}` already has projects configured. This is not allowed.');
    final projectsForCompany = projects.where((element) => element.publisher == company.name).toList();
    company.projects = projectsForCompany.map((e) => e.toMinimizedProject()).toList();
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
