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
      'images',
      'links',
      'projects'
    ],
    requiredKeys: const ['githubUserName'],
  );
  return Developer(
    githubUserName: json['githubUserName'] as String,
    name: json['name'] as String?,
    description: json['description'] as String?,
    images: json['images'] == null
        ? null
        : DeveloperImages.fromJson(json['images'] as Map<String, dynamic>),
    links: json['links'] == null
        ? null
        : DeveloperLinks.fromJson(json['links'] as Map<String, dynamic>),
    projects: (json['projects'] as List<dynamic>?)
        ?.map((e) => MinimizedProject.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DeveloperToJson(Developer instance) {
  final val = <String, dynamic>{
    'githubUserName': instance.githubUserName,
    'name': instance.name,
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('images', instance.images?.toJson());
  val['links'] = instance.links?.toJson();
  writeNotNull('projects', instance.projects?.map((e) => e.toJson()).toList());
  return val;
}
