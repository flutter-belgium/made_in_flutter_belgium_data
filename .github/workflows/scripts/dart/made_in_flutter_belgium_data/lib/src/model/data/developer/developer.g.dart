// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Developer _$DeveloperFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'githubUserName',
      'name',
      'description',
      'links',
      'projects',
      'images'
    ],
    requiredKeys: const ['githubUserName'],
  );
  return Developer(
    githubUserName: json['githubUserName'] as String,
    name: json['name'] as String?,
    description: json['description'] as String?,
    links: json['links'] == null
        ? null
        : DeveloperLinks.fromJson(json['links'] as Map<String, dynamic>),
    projects: (json['projects'] as List<dynamic>?)
        ?.map((e) => MinimizedProject.fromJson(e as Map<String, dynamic>))
        .toList(),
    images: json['images'] == null
        ? null
        : DeveloperImages.fromJson(json['images'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeveloperToJson(Developer instance) {
  final val = <String, dynamic>{
    'githubUserName': instance.githubUserName,
    'name': instance.name,
    'description': instance.description,
    'links': instance.links?.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('projects', instance.projects?.map((e) => e.toJson()).toList());
  writeNotNull('images', instance.images?.toJson());
  return val;
}
