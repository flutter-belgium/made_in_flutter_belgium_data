// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'project_links.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectLinks {
  @JsonKey(name: 'appstore')
  final String? appstore;
  @JsonKey(name: 'playstore')
  final String? playstore;
  @JsonKey(name: 'webApp')
  final String? webApp;
  @JsonKey(name: 'marketingWebsite')
  final String? marketingWebsite;
  @JsonKey(name: 'youTube')
  final String? youTube;
  @JsonKey(name: 'demoYouTubeVideo')
  final String? demoYouTubeVideo;
  @JsonKey(name: 'openSourceCode')
  final String? openSourceCode;

  const ProjectLinks({
    this.appstore,
    this.playstore,
    this.webApp,
    this.marketingWebsite,
    this.youTube,
    this.demoYouTubeVideo,
    this.openSourceCode,
  });

  factory ProjectLinks.fromJson(Map<String, dynamic> json) =>
      _$ProjectLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectLinksToJson(this);
}
