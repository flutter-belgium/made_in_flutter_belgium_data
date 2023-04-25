// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDeveloper _$ProjectDeveloperFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['githubUserName'],
  );
  return ProjectDeveloper(
    githubUserName: json['githubUserName'] as String,
    companyName: json['companyName'] as String?,
  );
}

Map<String, dynamic> _$ProjectDeveloperToJson(ProjectDeveloper instance) =>
    <String, dynamic>{
      'githubUserName': instance.githubUserName,
      'companyName': instance.companyName,
    };
