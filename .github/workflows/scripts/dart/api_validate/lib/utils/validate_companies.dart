import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<void> validateCompanies(String workingDirPath) async {
  final companiesDirectory = Directory(join(workingDirPath, 'companies'));
  if (!companiesDirectory.existsSync()) throw ArgumentError('companies directory not found');
  for (final dir in companiesDirectory.listSync()) {
    if (dir is! Directory) continue;
    final dirSegments = dir.uri.pathSegments;
    final companyName = dirSegments[dirSegments.length - 1];
    print('Company: $companyName start validation');
    final infoJsonFile = File(join(dir.path, 'info.json'));
    final infoJsonString = await infoJsonFile.readAsString();
    Company.fromJson(jsonDecode(infoJsonString) as Map<String, dynamic>);
    print('Company: $companyName has a valid info.json 💙💙!');
  }
}
