import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:collection/collection.dart';

Future<void> validateAll(List<Project> projects, List<Company> companies) async {
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
    final projectImages = project.images;
    if (projectImages == null) {
      throw ArgumentError('Project `${project.name}` has no images configured! Create a bug ticket for this. Because this should not happen!');
    }

    project.images = ProjectImages(
      appIconUrl: projectImages.appIconUrl,
      screenshotUrls: projectImages.screenshotUrls,
      bannerUrl: projectImages.bannerUrl,
      companyLogoUrl: companyForProject.images?.logoUrl,
    );
    print('🤍 `${project.name}` has a valid publisher!');
  }
  if (companies.length != activePublisher.length) {
    throw ArgumentError('1 or more companies are not used in any project:\n\n${companies.where((element) => !activePublisher.contains(element)).map((e) => e.name).join('\n')}');
  }
}
