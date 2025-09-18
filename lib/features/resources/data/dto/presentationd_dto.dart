import 'package:datn_mobile/features/resources/data/dto/slide_dto.dart';
import 'package:datn_mobile/features/resources/domain/entity/presentation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presentationd_dto.g.dart';

@JsonSerializable()
class PresentationDto {
  String id;
  String title;
  Object metaData;
  List<SlideDto> slides;
  DateTime createdAt;
  DateTime updatedAt;
  bool isParsed;

  PresentationDto({
    required this.id,
    required this.title,
    required this.metaData,
    required this.slides,
    required this.createdAt,
    required this.updatedAt,
    required this.isParsed,
  });

  factory PresentationDto.fromJson(Map<String, dynamic> json) =>
      _$PresentationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PresentationDtoToJson(this);
}

extension PresentationMapper on PresentationDto {
  Presentation toEntity() => Presentation(
      id: id,
      title: title,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isParsed: isParsed,
      slides: slides.map((e) => e.toEntity()).toList(),
      metaData: {},
      deletedAt: DateTime.now());
}

extension PresentationEntityMapper on Presentation {
  PresentationDto toDto() => PresentationDto(
      id: id,
      title: title,
      metaData: {},
      slides: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isParsed: false);
}
