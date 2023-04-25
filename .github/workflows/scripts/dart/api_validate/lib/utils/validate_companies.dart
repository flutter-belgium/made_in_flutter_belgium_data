import 'dart:io';

import 'package:path/path.dart';

Future<void> validateCompanies(String workingDirPath) async {
  final companiesDir = Directory(join(workingDirPath, 'companies'));
  if (!companiesDir.existsSync()) throw ArgumentError('companies directory not found');
}
