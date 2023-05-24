import 'package:api_validate/src/validation/url/validate_url.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

const _playStorePrefix = 'https://play.google.com/store/apps/details?id=';
const _appStorePrefix = 'https://apps.apple.com/';

Future<void> validateProjectLinks(Project project) async {
  final links = project.links;
  if (links == null) return;
  await validateUrl(links.playstore, 'playstore',
      requiredPrefixes: [_playStorePrefix]);
  await validateUrl(links.appstore, 'appstore',
      requiredPrefixes: [_appStorePrefix]);
  await validateUrl(links.webApp, 'webApp');
  await validateUrl(links.marketingWebsite, 'marketingWebsite');
  await validateUrl(links.youTube, 'youTube');
  await validateUrl(links.demoYouTubeVideo, 'demoYouTubeVideo');
}
