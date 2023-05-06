import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

Future<List<T>> validateDir<T>(
  String workingDirPath,
  String dirName,
  String dataType,
  Future<T> Function(Map<String, dynamic> data, Directory itemDir) parser,
) async {
  final dir = Directory(join(workingDirPath, dirName));
  if (!dir.existsSync()) throw ArgumentError('$dirName directory not found');
  final data = <T>[];
  for (final itemDir in dir.listSync()) {
    if (itemDir is! Directory) continue;
    final dirSegments = itemDir.uri.pathSegments;
    final projectName = dirSegments[dirSegments.length - 2];
    print('🔎 $dataType: `$projectName` start validation');
    final infoJsonFile = File(join(itemDir.path, 'info.json'));
    final infoJsonString = await infoJsonFile.readAsString();
    final item = await parser(jsonDecode(infoJsonString) as Map<String, dynamic>, itemDir);
    print('🤍 $dataType: `$projectName` has a valid info.json!');
    data.add(item);
  }
  return data;
}

