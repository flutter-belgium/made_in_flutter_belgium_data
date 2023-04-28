import 'package:api_validate/validation/developer/validate_profile_picture.dart';
import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

Future<void> validateProjectDevelopers(Project project) async {
  final developers = project.developers;
  if (developers == null) {
    project.developers = [];
    return;
  }
  for (final developer in developers) {
    developer.profilePictureUrl = await getProfilePictureUrl(developer);
  }
}
