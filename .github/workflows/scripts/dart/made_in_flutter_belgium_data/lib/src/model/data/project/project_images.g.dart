// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectImages _$ProjectImagesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['screenshotsUrls', 'appIconUrl'],
  );
  return ProjectImages(
    screenshotsUrls: (json['screenshotsUrls'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    appIconUrl: json['appIconUrl'] as String,
    bannerUrl: json['bannerUrl'] as String?,
  );
}

Map<String, dynamic> _$ProjectImagesToJson(ProjectImages instance) =>
    <String, dynamic>{
      'screenshotsUrls': instance.screenshotsUrls,
      'appIconUrl': instance.appIconUrl,
      'bannerUrl': instance.bannerUrl,
    };
