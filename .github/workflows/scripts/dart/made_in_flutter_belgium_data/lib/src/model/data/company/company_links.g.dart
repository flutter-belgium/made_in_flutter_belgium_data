// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyLinks _$CompanyLinksFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['website'],
    requiredKeys: const ['website'],
  );
  return CompanyLinks(
    website: json['website'] as String,
  );
}

Map<String, dynamic> _$CompanyLinksToJson(CompanyLinks instance) =>
    <String, dynamic>{
      'website': instance.website,
    };
