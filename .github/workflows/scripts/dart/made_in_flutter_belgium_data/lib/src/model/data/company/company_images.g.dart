// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyImages _$CompanyImagesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['logoUrl'],
    requiredKeys: const ['logoUrl'],
  );
  return CompanyImages(
    logoUrl: json['logoUrl'] as String,
  );
}

Map<String, dynamic> _$CompanyImagesToJson(CompanyImages instance) =>
    <String, dynamic>{
      'logoUrl': instance.logoUrl,
    };
