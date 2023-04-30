// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/company/company_developer.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/company/company_images.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/company/company_links.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/project/minimized_project.dart';

part 'company.g.dart';

@JsonSerializable(explicitToJson: true)
class Company {
  @JsonKey(name: 'name', required: true)
  final String name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'useLogoInsteadOfTextTitle', includeIfNull: false)
  final bool? useLogoInsteadOfTextTitle;
  @JsonKey(name: 'links')
  final CompanyLinks? links;
  @JsonKey(name: 'developers')
  final List<CompanyDeveloper>? developers;
  @JsonKey(name: 'projects', includeIfNull: false)
  List<MinimizedProject>? projects;
  @JsonKey(name: 'images', includeIfNull: false)
  CompanyImages? images;

  Company({
    required this.name,
    this.description,
    this.useLogoInsteadOfTextTitle = false,
    this.links,
    this.developers,
    this.projects,
    this.images,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

}
