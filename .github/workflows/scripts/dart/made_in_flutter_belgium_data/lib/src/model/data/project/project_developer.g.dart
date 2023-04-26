// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDeveloper _$ProjectDeveloperFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['githubUserName'],
    requiredKeys: const ['githubUserName'],
  );
  return ProjectDeveloper(
    githubUserName: json['githubUserName'] as String,
  );
}

Map<String, dynamic> _$ProjectDeveloperToJson(ProjectDeveloper instance) =>
    <String, dynamic>{
      'githubUserName': instance.githubUserName,
    };
