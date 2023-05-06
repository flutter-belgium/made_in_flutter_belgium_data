import 'package:api_validate/src/validation/url/validate_url.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

const _linkedInPrefix = 'https://linkedin.com/in/';
const _linkedInPrefix2 = 'https://www.linkedin.com/in/';

Future<void> validateDeveloperLinks(Developer company) async {
  final links = company.links;
  if (links == null) return;
  await validateUrl(links.personalWebsite, 'personalWebsite');
  await validateUrl(links.freelanceWebsite, 'freelanceWebsite');
  await validateUrl(links.linkedin, 'linkedin', skipGetCheck: true, requiredPrefixes: [
    _linkedInPrefix,
    _linkedInPrefix2,
  ]);
}
