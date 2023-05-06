// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'developer_images.g.dart';

@JsonSerializable(explicitToJson: true)
class DeveloperImages {
  @JsonKey(name: 'profilePictureUrl', required: true)
  final String profilePictureUrl;

  const DeveloperImages({
    required this.profilePictureUrl,
  });

  factory DeveloperImages.fromJson(Map<String, dynamic> json) => _$DeveloperImagesFromJson(json);

  Map<String, dynamic> toJson() => _$DeveloperImagesToJson(this);

}
