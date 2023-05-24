// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'minimized_project.g.dart';

@JsonSerializable(explicitToJson: true)
class MinimizedProject {
  @JsonKey(name: 'name', required: true)
  final String name;
  @JsonKey(name: 'appIconUrl', required: true)
  final String appIconUrl;
  @JsonKey(name: 'publisher', includeIfNull: false, ignore: true)
  String? publisher;

  MinimizedProject({
    required this.name,
    required this.appIconUrl,
    this.publisher,
  });

  factory MinimizedProject.fromJson(Map<String, dynamic> json) =>
      _$MinimizedProjectFromJson(json);

  Map<String, dynamic> toJson() => _$MinimizedProjectToJson(this);
}
