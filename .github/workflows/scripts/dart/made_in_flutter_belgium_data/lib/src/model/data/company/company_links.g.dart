// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyLinks _$CompanyLinksFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['website', 'jobWebsite'],
    requiredKeys: const ['website'],
  );
  return CompanyLinks(
    website: json['website'] as String,
    jobWebsite: json['jobWebsite'] as String?,
  );
}

Map<String, dynamic> _$CompanyLinksToJson(CompanyLinks instance) =>
    <String, dynamic>{
      'website': instance.website,
      'jobWebsite': instance.jobWebsite,
    };
