// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectImages _$ProjectImagesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'appIconUrl',
      'screenshotUrls',
      'companyLogoUrl',
      'bannerUrl'
    ],
    requiredKeys: const ['appIconUrl', 'screenshotUrls'],
  );
  return ProjectImages(
    appIconUrl: json['appIconUrl'] as String,
    screenshotUrls: (json['screenshotUrls'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    companyLogoUrl: json['companyLogoUrl'] as String?,
    bannerUrl: json['bannerUrl'] as String?,
  );
}

Map<String, dynamic> _$ProjectImagesToJson(ProjectImages instance) =>
    <String, dynamic>{
      'appIconUrl': instance.appIconUrl,
      'screenshotUrls': instance.screenshotUrls,
      'companyLogoUrl': instance.companyLogoUrl,
      'bannerUrl': instance.bannerUrl,
    };
