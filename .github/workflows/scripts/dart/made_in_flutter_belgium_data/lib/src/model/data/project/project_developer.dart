// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'project_developer.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectDeveloper {
  @JsonKey(name: 'githubUserName', required: true)
  final String githubUserName;
  @JsonKey(name: 'companyName')
  final String? companyName;

  const ProjectDeveloper({
    required this.githubUserName,
    this.companyName,
  });

  factory ProjectDeveloper.fromJson(Map<String, dynamic> json) => _$ProjectDeveloperFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDeveloperToJson(this);

}
