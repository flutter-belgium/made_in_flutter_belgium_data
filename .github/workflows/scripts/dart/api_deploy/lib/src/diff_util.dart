import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<void> checkForNewProjects(
    List<Project> apiProjects, List<Project> generateProjects) async {
  final newProjects = <Project>[];
  for (final project in generateProjects) {
    final projects = apiProjects
        .where((generatedProject) => generatedProject.name == project.name);
    if (projects.isEmpty) {
      newProjects.add(project);
    }
  }
  if (newProjects.isEmpty) {
    print('No new projects detected');
  } else {
    print('New projects: ${newProjects.length}');
    print(newProjects.map((e) => e.name).join(', '));
  }
}

Future<void> checkForNewCompanies(
    List<Company> apiCompanies, List<Company> generatedCompanies) async {
  final newCompanies = <Company>[];
  for (final company in generatedCompanies) {
    final companies = apiCompanies
        .where((generatedProject) => generatedProject.name == company.name);
    if (companies.isEmpty) {
      newCompanies.add(company);
    }
  }
  if (newCompanies.isEmpty) {
    print('No new companies detected');
  } else {
    print('New companies: ${newCompanies.length}');
    print(newCompanies.map((e) => e.name).join(', '));
  }
}
