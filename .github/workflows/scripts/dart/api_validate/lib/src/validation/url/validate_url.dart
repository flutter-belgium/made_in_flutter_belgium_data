import 'package:http/http.dart';

Future<void> validateUrl(String? url, String name) async {
  if (url == null) return;
  final result = await get(Uri.parse(url));
  if (result.statusCode == 200) return;
  throw ArgumentError('`$url` is not valid for `$name`, response code was ${result.statusCode}');
}
