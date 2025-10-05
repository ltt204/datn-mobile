import 'package:datn_mobile/features/projects/domain/entity/value_object/slide.dart';

class Presentation {
  String id;
  String title;
  List<Slide> slides;
  DateTime createdAt;
  DateTime updatedAt;
  bool isParsed;
  Object metaData;
  DateTime deletedAt;

  Presentation({
    required this.id,
    required this.title,
    required this.slides,
    required this.createdAt,
    required this.updatedAt,
    required this.isParsed,
    required this.metaData,
    required this.deletedAt,
  });
}
