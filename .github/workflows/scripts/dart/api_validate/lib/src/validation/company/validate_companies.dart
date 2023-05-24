import 'dart:convert';
import 'dart:io';

import 'package:api_validate/src/validation/company/validate_company_images.dart';
import 'package:api_validate/src/validation/company/validate_company_links.dart';
import 'package:api_validate/src/validation/validate_dir.dart';
import 'package:api_validate/src/writor/list_writor.dart';
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
      await validateCompanyImages(company, workingDirPath, itemDir);
      await validateCompanyLinks(company);
      return company;
    },
  );
  return companies
    ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
}

Future<void> saveCompaniesToApi(
    List<Company> companies, String workingDirPath) async {
  final dir = join('api', 'companies');
  final companiesApiDir = Directory(join(workingDirPath, dir));
  for (final company in companies) {
    final developerPath = join(companiesApiDir.path, company.name);
    final companiesDir = Directory(developerPath);
    if (!companiesDir.existsSync()) {
      companiesDir.createSync(recursive: true);
    }
    final companyInfoFile = File(join(developerPath, 'info.json'));
    companyInfoFile.writeAsStringSync(jsonEncode(company));
  }
  writeListToFile(
      companies, companiesApiDir, 'all', (e) => e.toMinimizedCompany());
  final agencyCompanies =
      companies.where((element) => element.isAgency == true).toList();
  writeListToFile(agencyCompanies, companiesApiDir, 'agencies',
      (e) => e.toMinimizedCompany());
}
