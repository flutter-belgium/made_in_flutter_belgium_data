// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'project_images.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectImages {
  @JsonKey(name: 'screenshotsUrls', required: true)
  final List<String> screenshotsUrls;
  @JsonKey(name: 'appIconUrl', required: true)
  final String appIconUrl;
  @JsonKey(name: 'bannerUrl')
  final String? bannerUrl;

  const ProjectImages({
    required this.screenshotsUrls,
    required this.appIconUrl,
    this.bannerUrl,
  });

  factory ProjectImages.fromJson(Map<String, dynamic> json) => _$ProjectImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectImagesToJson(this);

}
