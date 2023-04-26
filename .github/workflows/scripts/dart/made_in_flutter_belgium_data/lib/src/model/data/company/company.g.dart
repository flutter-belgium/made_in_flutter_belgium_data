// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'links', 'developers', 'images'],
    requiredKeys: const ['name'],
  );
  return Company(
    name: json['name'] as String,
    links: json['links'] == null
        ? null
        : CompanyLinks.fromJson(json['links'] as Map<String, dynamic>),
    developers: (json['developers'] as List<dynamic>?)
        ?.map((e) => CompanyDeveloper.fromJson(e as Map<String, dynamic>))
        .toList(),
    images: json['images'] == null
        ? null
        : CompanyImages.fromJson(json['images'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'links': instance.links?.toJson(),
    'developers': instance.developers?.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('images', instance.images?.toJson());
  return val;
}
