// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'project_links.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectLinks {
  @JsonKey(name: 'appstore')
  final String? appstore;
  @JsonKey(name: 'playstore')
  final String? playstore;
  @JsonKey(name: 'website')
  final String? website;
  @JsonKey(name: 'youTube')
  final String? youTube;
  @JsonKey(name: 'demoYouTubeVideo')
  final String? demoYouTubeVideo;

  const ProjectLinks({
    this.appstore,
    this.playstore,
    this.website,
    this.youTube,
    this.demoYouTubeVideo,
  });

  factory ProjectLinks.fromJson(Map<String, dynamic> json) =>
      _$ProjectLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectLinksToJson(this);
}
