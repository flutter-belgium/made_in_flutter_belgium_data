// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'minimized_company.g.dart';

@JsonSerializable(explicitToJson: true)
class MinimizedCompany {
  @JsonKey(name: 'name', required: true)
  final String name;
  @JsonKey(name: 'logoUrl', required: true)
  final String logoUrl;
  @JsonKey(name: 'useLogoInsteadOfTextTitle', required: true)
  final bool useLogoInsteadOfTextTitle;

  const MinimizedCompany({
    required this.name,
    required this.logoUrl,
    required this.useLogoInsteadOfTextTitle,
  });

  factory MinimizedCompany.fromJson(Map<String, dynamic> json) =>
      _$MinimizedCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$MinimizedCompanyToJson(this);
}
