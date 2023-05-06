import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';

extension DeveloperExtension on Developer {
  MinimizedDeveloper toMinimizedDeveloper() => MinimizedDeveloper(
        githubUserName: githubUserName,
        name: name,
        profilePictureUrl: images!.profilePictureUrl,
      );
}
