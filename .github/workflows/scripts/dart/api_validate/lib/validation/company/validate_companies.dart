import 'dart:convert';
import 'dart:io';

import 'package:api_validate/validation/company/validate_companies_images.dart';
import 'package:api_validate/validation/validate_dir.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:path/path.dart';

Future<List<Company>> validateCompanies(String workingDirPath) async {
  final companies = await validateDir(
    workingDirPath,
    'companies',
    'Company',
    (data, itemDir) async {
      final company = Company.fromJson(data);
      final baseName = basename(itemDir.path);
      if (baseName != company.name) {
        throw ArgumentError(
          '${company.name} has an invalid name. (directory and name in info.json should be the same)\n\n'
          'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/companies',
        );
      }
      validateCompanyImages(company, workingDirPath, itemDir);
      return company;
    },
  );
  return companies..sort((a, b) => a.name.compareTo(b.name));
}

Future<void> saveCompaniesToApi(List<Company> companies, String workingDirPath) async {
  final dir = join('api', 'companies');
  final companiesApiDir = Directory(join(workingDirPath, dir));
  if (!companiesApiDir.existsSync()) {
    companiesApiDir.createSync(recursive: true);
  }
  for (final company in companies) {
    final companiesDir = Directory(join(dir, company.name));
    if (!companiesDir.existsSync()) {
      companiesDir.createSync(recursive: true);
    }
    final companyInfoFile = File(join(workingDirPath, companiesDir.path, 'info.json'));
    companyInfoFile.writeAsStringSync(jsonEncode(company));
  }

  final file = join(dir, 'all.json');
  final companiesInfoFile = File(join(workingDirPath, file));
  companiesInfoFile.writeAsStringSync(jsonEncode(companies));
  print('$file is saved successfully 💙💙!');
}
