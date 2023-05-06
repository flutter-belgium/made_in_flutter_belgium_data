// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeveloperImages _$DeveloperImagesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['profilePictureUrl'],
    requiredKeys: const ['profilePictureUrl'],
  );
  return DeveloperImages(
    profilePictureUrl: json['profilePictureUrl'] as String,
  );
}

Map<String, dynamic> _$DeveloperImagesToJson(DeveloperImages instance) =>
    <String, dynamic>{
      'profilePictureUrl': instance.profilePictureUrl,
    };
