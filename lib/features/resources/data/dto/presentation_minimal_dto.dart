import 'package:datn_mobile/features/resources/data/dto/slide_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presentation_minimal_dto.g.dart';

@JsonSerializable()
class PresentationMinimalDto {
  String? id;
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;
  SlideDto? thumbnail;

  PresentationMinimalDto({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.thumbnail,
  });

  factory PresentationMinimalDto.fromJson(Map<String, dynamic> json) =>
      _$PresentationMinimalDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PresentationMinimalDtoToJson(this);
}
