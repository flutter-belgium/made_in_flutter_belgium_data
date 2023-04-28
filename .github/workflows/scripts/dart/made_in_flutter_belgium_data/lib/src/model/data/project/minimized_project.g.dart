// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimized_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinimizedProject _$MinimizedProjectFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'appIconUrl'],
    requiredKeys: const ['name', 'appIconUrl'],
  );
  return MinimizedProject(
    name: json['name'] as String,
    appIconUrl: json['appIconUrl'] as String,
  );
}

Map<String, dynamic> _$MinimizedProjectToJson(MinimizedProject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'appIconUrl': instance.appIconUrl,
    };
