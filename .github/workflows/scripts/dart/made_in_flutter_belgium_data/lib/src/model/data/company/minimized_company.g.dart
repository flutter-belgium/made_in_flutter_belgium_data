// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimized_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinimizedCompany _$MinimizedCompanyFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'logoUrl', 'useLogoInsteadOfTextTitle'],
    requiredKeys: const ['name', 'logoUrl', 'useLogoInsteadOfTextTitle'],
  );
  return MinimizedCompany(
    name: json['name'] as String,
    logoUrl: json['logoUrl'] as String,
    useLogoInsteadOfTextTitle: json['useLogoInsteadOfTextTitle'] as bool,
  );
}

Map<String, dynamic> _$MinimizedCompanyToJson(MinimizedCompany instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'useLogoInsteadOfTextTitle': instance.useLogoInsteadOfTextTitle,
    };
