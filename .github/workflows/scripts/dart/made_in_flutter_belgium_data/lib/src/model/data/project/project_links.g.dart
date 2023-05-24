// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectLinks _$ProjectLinksFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'appstore',
      'playstore',
      'webApp',
      'marketingWebsite',
      'youTube',
      'demoYouTubeVideo',
      'openSourceCode'
    ],
  );
  return ProjectLinks(
    appstore: json['appstore'] as String?,
    playstore: json['playstore'] as String?,
    webApp: json['webApp'] as String?,
    marketingWebsite: json['marketingWebsite'] as String?,
    youTube: json['youTube'] as String?,
    demoYouTubeVideo: json['demoYouTubeVideo'] as String?,
    openSourceCode: json['openSourceCode'] as String?,
  );
}

Map<String, dynamic> _$ProjectLinksToJson(ProjectLinks instance) =>
    <String, dynamic>{
      'appstore': instance.appstore,
      'playstore': instance.playstore,
      'webApp': instance.webApp,
      'marketingWebsite': instance.marketingWebsite,
      'youTube': instance.youTube,
      'demoYouTubeVideo': instance.demoYouTubeVideo,
      'openSourceCode': instance.openSourceCode,
    };
