import 'package:api_validate/src/validation/url/validate_url.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

const _playStorePrefix = 'https://play.google.com/store/apps/details?id=';
const _appStorePrefix = 'https://apps.apple.com/';

Future<void> validateProjectLinks(Project project) async {
  final links = project.links;
  if (links == null) return;
  final playStoreLink = links.playstore;
  if (playStoreLink != null) {
    if (!playStoreLink.startsWith(_playStorePrefix)) {
      throw Exception('Invalid playstore link: should start with $_playStorePrefix');
    }
    await validateUrl(playStoreLink, 'playstore');
  }

  final appStoreLink = links.appstore;
  if (appStoreLink != null) {
    if (!appStoreLink.startsWith(_appStorePrefix)) {
      throw Exception('Invalid appstore link: should start with $_appStorePrefix');
    }
    await validateUrl(appStoreLink, 'appstore');
  }
  await validateUrl(links.website, 'website');
  await validateUrl(links.youTube, 'youTube');
  await validateUrl(links.demoYouTubeVideo, 'demoYouTubeVideo');
}
