// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeveloperLinks _$DeveloperLinksFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['linkedin', 'personalWebsite', 'freelanceWebsite'],
  );
  return DeveloperLinks(
    linkedin: json['linkedin'] as String?,
    personalWebsite: json['personalWebsite'] as String?,
    freelanceWebsite: json['freelanceWebsite'] as String?,
  );
}

Map<String, dynamic> _$DeveloperLinksToJson(DeveloperLinks instance) =>
    <String, dynamic>{
      'linkedin': instance.linkedin,
      'personalWebsite': instance.personalWebsite,
      'freelanceWebsite': instance.freelanceWebsite,
    };
