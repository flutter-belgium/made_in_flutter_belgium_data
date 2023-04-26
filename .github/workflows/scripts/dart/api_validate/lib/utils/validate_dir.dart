import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

Future<List<T>> validateDir<T>(
  String workingDirPath,
  String dirName,
  String dataType,
  T Function(Map<String, dynamic> data, Directory itemDir) parser,
) async {
  final dir = Directory(join(workingDirPath, dirName));
  if (!dir.existsSync()) throw ArgumentError('$dirName directory not found');
  final data = <T>[];
  for (final dir in dir.listSync()) {
    if (dir is! Directory) continue;
    final dirSegments = dir.uri.pathSegments;
    final projectName = dirSegments[dirSegments.length - 2];
    print('$dataType: `$projectName` start validation');
    final infoJsonFile = File(join(dir.path, 'info.json'));
    final infoJsonString = await infoJsonFile.readAsString();
    final item = parser(jsonDecode(infoJsonString) as Map<String, dynamic>, dir);
    print('$dataType: `$projectName` has a valid info.json 💙!');
    data.add(item);
  }
  return data;
}

