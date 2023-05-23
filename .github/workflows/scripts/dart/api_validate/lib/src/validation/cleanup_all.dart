import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<void> cleanupAll(List<Project> projects, List<Company> companies, List<Developer> developers) async {
  for (final project in projects) {
    final developers = project.developers;
    if (developers == null) continue;
    for (final developer in developers) {
      developer.companyName = null;
    }
  }
}
