import 'package:api_validate/utils/validate_dir.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:path/path.dart';

Future<void> validateCompanies(String workingDirPath) async {
  await validateDir(
    workingDirPath,
    'companies',
    'Company',
    (data, itemDir) {
      final company = Company.fromJson(data);
      final baseName = basename(itemDir.path);
      if (baseName != company.name) {
        throw ArgumentError(
          '${company.name} has an invalid name. (directory and name in info.json should be the same)\n\n'
          'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
        );
      }
      return company;
    },
  );
}
