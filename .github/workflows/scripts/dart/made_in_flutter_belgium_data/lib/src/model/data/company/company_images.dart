// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'company_images.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyImages {
  @JsonKey(name: 'logoUrl', required: true)
  final String logoUrl;

  const CompanyImages({
    required this.logoUrl,
  });

  factory CompanyImages.fromJson(Map<String, dynamic> json) =>
      _$CompanyImagesFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyImagesToJson(this);
}
