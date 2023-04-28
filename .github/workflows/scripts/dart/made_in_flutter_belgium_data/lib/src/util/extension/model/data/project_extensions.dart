import 'package:made_in_flutter_belgium_data/src/model/data/project/minimized_project.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/project/project.dart';

extension ProjectExtension on Project {
  MinimizedProject toProjectMinimized() {
    return MinimizedProject(
      name: name,
      appIconUrl: images!.appIconUrl,
      publisher: publisher,
    );
  }
}
