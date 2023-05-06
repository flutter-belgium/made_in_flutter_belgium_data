import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

class ApiValidationData {
  final List<Company> companies;
  final List<Developer> developers;
  final List<Project> projects;

  ApiValidationData({
    required this.companies,
    required this.developers,
    required this.projects,
  });
}
