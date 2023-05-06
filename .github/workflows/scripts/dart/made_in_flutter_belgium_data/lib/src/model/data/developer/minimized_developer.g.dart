// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimized_developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinimizedDeveloper _$MinimizedDeveloperFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['githubUserName', 'name', 'profilePictureUrl'],
    requiredKeys: const ['githubUserName'],
  );
  return MinimizedDeveloper(
    githubUserName: json['githubUserName'] as String,
    name: json['name'] as String?,
    profilePictureUrl: json['profilePictureUrl'] as String?,
  );
}

Map<String, dynamic> _$MinimizedDeveloperToJson(MinimizedDeveloper instance) {
  final val = <String, dynamic>{
    'githubUserName': instance.githubUserName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('profilePictureUrl', instance.profilePictureUrl);
  return val;
}
