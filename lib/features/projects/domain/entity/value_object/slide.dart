import 'package:datn_mobile/features/projects/domain/entity/value_object/slide_background.dart';
import 'package:datn_mobile/features/projects/domain/entity/value_object/slide_element.dart';

class Slide {
  String id;
  List<SlideElement> elements;
  SlideBackground background;
  Map<String, Object> extraFields = <String, Object>{};

  Slide({required this.id, required this.elements, required this.background});

  void setExtraField(String key, Object value) {
    extraFields[key] = value;
  }

  Map<String, Object> getExtraFields() {
    return extraFields;
  }
}
