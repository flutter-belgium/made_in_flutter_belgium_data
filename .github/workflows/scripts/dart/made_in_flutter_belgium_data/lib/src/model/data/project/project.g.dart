// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'description', 'releaseData'],
  );
  return Project(
    name: json['name'] as String,
    description: json['description'] as String,
    releaseData: DateTime.parse(json['releaseData'] as String),
    company: json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
    developers: (json['developers'] as List<dynamic>?)
        ?.map((e) => ProjectDeveloper.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'releaseData': instance.releaseData.toIso8601String(),
      'company': instance.company?.toJson(),
      'developers': instance.developers?.map((e) => e.toJson()).toList(),
    };
