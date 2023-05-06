// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'minimized_developer.g.dart';

@JsonSerializable(explicitToJson: true)
class MinimizedDeveloper {
  @JsonKey(name: 'githubUserName', required: true)
  final String githubUserName;
  @JsonKey(name: 'name', includeIfNull: false)
  String? name;
  @JsonKey(name: 'profilePictureUrl', includeIfNull: false)
  String? profilePictureUrl;

  MinimizedDeveloper({
    required this.githubUserName,
    this.name,
    this.profilePictureUrl,
  });

  factory MinimizedDeveloper.fromJson(Map<String, dynamic> json) => _$MinimizedDeveloperFromJson(json);

  Map<String, dynamic> toJson() => _$MinimizedDeveloperToJson(this);

}
