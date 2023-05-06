// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/developer/developer_images.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/developer/developer_links.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/project/minimized_project.dart';

part 'developer.g.dart';

@JsonSerializable(explicitToJson: true)
class Developer {
  @JsonKey(name: 'githubUserName', required: true)
  final String githubUserName;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'images', includeIfNull: false)
  DeveloperImages? images;
  @JsonKey(name: 'links')
  final DeveloperLinks? links;
  @JsonKey(name: 'projects', includeIfNull: false)
  List<MinimizedProject>? projects;

  Developer({
    required this.githubUserName,
    this.name,
    this.description,
    this.images,
    this.links,
    this.projects,
  });

  factory Developer.fromJson(Map<String, dynamic> json) => _$DeveloperFromJson(json);

  Map<String, dynamic> toJson() => _$DeveloperToJson(this);

}
