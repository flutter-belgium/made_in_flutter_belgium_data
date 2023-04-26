// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDeveloper _$CompanyDeveloperFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['githubUserName', 'role'],
    requiredKeys: const ['githubUserName'],
  );
  return CompanyDeveloper(
    githubUserName: json['githubUserName'] as String,
    role: json['role'] as String?,
  );
}

Map<String, dynamic> _$CompanyDeveloperToJson(CompanyDeveloper instance) =>
    <String, dynamic>{
      'githubUserName': instance.githubUserName,
      'role': instance.role,
    };
