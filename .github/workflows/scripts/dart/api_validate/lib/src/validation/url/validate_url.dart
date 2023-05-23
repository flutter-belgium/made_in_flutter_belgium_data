import 'package:collection/collection.dart';
import 'package:http/http.dart';

Future<void> validateUrl(String? url, String name,
    {bool skipGetCheck = false,
    List<String> requiredPrefixes = const []}) async {
  if (url == null) return;
  if (!url.startsWith('https://')) {
    throw ArgumentError(
        '`$url` is not valid for `$name`, should start with https://');
  }

  if (requiredPrefixes.isNotEmpty &&
      requiredPrefixes.none((prefix) => url.startsWith(prefix))) {
    throw ArgumentError(
        '$url is not valid for $name, should start with one of these $requiredPrefixes');
  }
  if (skipGetCheck) return;
  final result = await get(Uri.parse(url));
  if (result.statusCode == 200) return;
  throw ArgumentError(
      '`$url` is not valid for `$name`, response code was ${result.statusCode}');
}
