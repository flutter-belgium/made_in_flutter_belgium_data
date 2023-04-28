import 'dart:io';

import 'package:api_validate/api_validate.dart';
import 'package:path/path.dart';

Future<void> main(List<String> arguments) async {
  try {
    final workingDirPath = join(Directory.current.path, '..', '..', '..', '..', '..');
    await apiValidate(workingDirPath);
    print('💙💙 Validation completed successfully!! 💙💙');
  } catch (e) {
    if (e is ArgumentError) {
      print('\nError: ${e.message}\n');
      exit(-1);
    } else {
      rethrow;
    }
  }
}
