// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'developer_links.g.dart';

@JsonSerializable(explicitToJson: true)
class DeveloperLinks {
  @JsonKey(name: 'linkedin')
  final String? linkedin;
  @JsonKey(name: 'personalWebsite')
  final String? personalWebsite;
  @JsonKey(name: 'freelanceWebsite')
  final String? freelanceWebsite;

  const DeveloperLinks({
    this.linkedin,
    this.personalWebsite,
    this.freelanceWebsite,
  });

  factory DeveloperLinks.fromJson(Map<String, dynamic> json) =>
      _$DeveloperLinksFromJson(json);

  Map<String, dynamic> toJson() => _$DeveloperLinksToJson(this);
}
