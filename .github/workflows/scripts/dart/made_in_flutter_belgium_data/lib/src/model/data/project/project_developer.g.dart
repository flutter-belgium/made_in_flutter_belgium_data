// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDeveloper _$ProjectDeveloperFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['githubUserName', 'profilePictureUrl'],
    requiredKeys: const ['githubUserName'],
  );
  return ProjectDeveloper(
    githubUserName: json['githubUserName'] as String,
    profilePictureUrl: json['profilePictureUrl'] as String?,
  );
}

Map<String, dynamic> _$ProjectDeveloperToJson(ProjectDeveloper instance) {
  final val = <String, dynamic>{
    'githubUserName': instance.githubUserName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profilePictureUrl', instance.profilePictureUrl);
  return val;
}
