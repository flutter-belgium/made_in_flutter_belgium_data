// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'useLogoInsteadOfTextTitle',
      'description',
      'links',
      'developers',
      'projects',
      'involvedProjects',
      'images',
      'isAgency'
    ],
    requiredKeys: const ['name'],
  );
  return Company(
    name: json['name'] as String,
    useLogoInsteadOfTextTitle:
        json['useLogoInsteadOfTextTitle'] as bool? ?? false,
    description: json['description'] as String?,
    links: json['links'] == null
        ? null
        : CompanyLinks.fromJson(json['links'] as Map<String, dynamic>),
    developers: (json['developers'] as List<dynamic>?)
        ?.map((e) => MinimizedDeveloper.fromJson(e as Map<String, dynamic>))
        .toList(),
    projects: (json['projects'] as List<dynamic>?)
        ?.map((e) => MinimizedProject.fromJson(e as Map<String, dynamic>))
        .toList(),
    involvedProjects: (json['involvedProjects'] as List<dynamic>?)
        ?.map((e) => MinimizedProject.fromJson(e as Map<String, dynamic>))
        .toList(),
    images: json['images'] == null
        ? null
        : CompanyImages.fromJson(json['images'] as Map<String, dynamic>),
    isAgency: json['isAgency'] as bool? ?? false,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'useLogoInsteadOfTextTitle': instance.useLogoInsteadOfTextTitle,
    'description': instance.description,
    'links': instance.links?.toJson(),
    'developers': instance.developers?.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('projects', instance.projects?.map((e) => e.toJson()).toList());
  writeNotNull('involvedProjects',
      instance.involvedProjects?.map((e) => e.toJson()).toList());
  writeNotNull('images', instance.images?.toJson());
  writeNotNull('isAgency', instance.isAgency);
  return val;
}
