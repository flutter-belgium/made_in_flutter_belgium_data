// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectImages _$ProjectImagesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['screenshotUrls', 'appIconUrl', 'bannerUrl'],
    requiredKeys: const ['screenshotUrls', 'appIconUrl'],
  );
  return ProjectImages(
    screenshotUrls: (json['screenshotUrls'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    appIconUrl: json['appIconUrl'] as String,
    bannerUrl: json['bannerUrl'] as String?,
  );
}

Map<String, dynamic> _$ProjectImagesToJson(ProjectImages instance) =>
    <String, dynamic>{
      'screenshotUrls': instance.screenshotUrls,
      'appIconUrl': instance.appIconUrl,
      'bannerUrl': instance.bannerUrl,
    };
