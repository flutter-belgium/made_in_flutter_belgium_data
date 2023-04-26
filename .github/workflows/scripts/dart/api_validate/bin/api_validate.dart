import 'dart:io';

import 'package:api_validate/api_validate.dart';

Future<void> main(List<String> arguments) async {
  try {
    await apiValidate();
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
