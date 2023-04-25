// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/company/company.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/project/project_developer.dart';

part 'project.g.dart';

@JsonSerializable(explicitToJson: true)
class Project {
  @JsonKey(name: 'name', required: true)
  final String name;
  @JsonKey(name: 'description', required: true)
  final String description;
  @JsonKey(name: 'releaseData', required: true)
  final DateTime releaseData;
  @JsonKey(name: 'company')
  final Company? company;
  @JsonKey(name: 'developers')
  final List<ProjectDeveloper>? developers;

  const Project({
    required this.name,
    required this.description,
    required this.releaseData,
    this.company,
    this.developers,
  });

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

}
