// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'company_links.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyLinks {
  @JsonKey(name: 'website', required: true)
  final String website;

  const CompanyLinks({
    required this.website,
  });

  factory CompanyLinks.fromJson(Map<String, dynamic> json) => _$CompanyLinksFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyLinksToJson(this);

}
