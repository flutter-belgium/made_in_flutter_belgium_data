// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'company_developer.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyDeveloper {
  @JsonKey(name: 'githubUserName', required: true)
  final String githubUserName;
  @JsonKey(name: 'role')
  final String? role;

  const CompanyDeveloper({
    required this.githubUserName,
    this.role,
  });

  factory CompanyDeveloper.fromJson(Map<String, dynamic> json) => _$CompanyDeveloperFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDeveloperToJson(this);

}
