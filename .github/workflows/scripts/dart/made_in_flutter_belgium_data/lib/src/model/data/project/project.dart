// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/project/project_developer.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/project/project_images.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/project/project_links.dart';

part 'project.g.dart';

@JsonSerializable(explicitToJson: true)
class Project {
  @JsonKey(name: 'name', required: true)
  final String name;
  @JsonKey(name: 'description', required: true)
  final String description;
  @JsonKey(name: 'releaseData', required: true)
  final DateTime releaseData;
  @JsonKey(name: 'publisher')
  final String? publisher;
  @JsonKey(name: 'developers', includeIfNull: false)
  List<ProjectDeveloper>? developers;
  @JsonKey(name: 'links')
  final ProjectLinks? links;
  @JsonKey(name: 'images', includeIfNull: false)
  ProjectImages? images;

  Project({
    required this.name,
    required this.description,
    required this.releaseData,
    this.publisher,
    this.developers,
    this.links,
    this.images,
  });

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

}
