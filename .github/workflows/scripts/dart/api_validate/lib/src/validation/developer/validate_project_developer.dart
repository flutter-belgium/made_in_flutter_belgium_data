import 'package:api_validate/src/validation/developer/validate_profile_picture.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<void> validateProjectDeveloper(Project project) async {
  final minimizedDevelopers = project.developers;
  if (minimizedDevelopers == null) {
    project.developers = [];
    return;
  }
  for (final minimizedDeveloper in minimizedDevelopers) {
    minimizedDeveloper.profilePictureUrl = await getProfilePictureUrlForGithubUserName(minimizedDeveloper.githubUserName, minimizedDeveloper: minimizedDeveloper);
  }
}
