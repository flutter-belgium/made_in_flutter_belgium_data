import 'package:made_in_flutter_belgium_data/src/model/data/developer/minimized_developer.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/developer/project_developer.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/project/minimized_project.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/project/project.dart';

extension ProjectExtension on Project {
  MinimizedProject toMinimizedProject() => MinimizedProject(
        name: name,
        appIconUrl: images!.appIconUrl,
        publisher: publisher,
      );
}

extension ProjectDeveloperExtension on ProjectDeveloper {
  MinimizedDeveloper toMinimizedDeveloper() => MinimizedDeveloper(
        githubUserName: githubUserName,
        name: name,
      );
}
