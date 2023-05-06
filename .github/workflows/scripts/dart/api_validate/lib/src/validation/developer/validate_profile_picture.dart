import 'package:http/http.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<String> getProfilePictureUrlForGithubUserName(String githubUserName, {MinimizedDeveloper? minimizedDeveloper}) async {
  if (minimizedDeveloper != null && minimizedDeveloper.profilePictureUrl != null) {
    throw ArgumentError(
      'profilePictureUrl for $githubUserName was already set.'
      'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/projects',
    );
  }
  final url = 'https://avatars.githubusercontent.com/$githubUserName';
  final result = await get(Uri.parse(url));
  if (result.statusCode == 200) return url;
  throw ArgumentError('Failed to get the profile picture for $githubUserName, response code from $url was ${result.statusCode}');
}
