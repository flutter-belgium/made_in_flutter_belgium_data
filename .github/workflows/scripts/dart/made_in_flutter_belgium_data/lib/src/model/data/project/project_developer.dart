// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'project_developer.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectDeveloper {
  @JsonKey(name: 'githubUserName', required: true)
  final String githubUserName;
  @JsonKey(name: 'profilePictureUrl', includeIfNull: false)
  String? profilePictureUrl;

  ProjectDeveloper({
    required this.githubUserName,
    this.profilePictureUrl,
  });

  factory ProjectDeveloper.fromJson(Map<String, dynamic> json) => _$ProjectDeveloperFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDeveloperToJson(this);

}
