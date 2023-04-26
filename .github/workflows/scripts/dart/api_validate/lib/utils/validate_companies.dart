import 'package:api_validate/utils/validate_dir.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<List<Company>> validateCompanies(String workingDirPath) async {
  final companies = await validateDir(
    workingDirPath,
    'companies',
    'Company',
    (data, itemDir) => Company.fromJson(data),
  );
  return companies;
}
