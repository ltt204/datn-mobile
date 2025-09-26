enum SlideElementType {
  text("text"),
  image("image"),
  shape("shape"),
  line("line"),
  chart("chart"),
  table("table"),
  latex("latex"),
  video("video"),
  audio("audio");

  final String value;

  const SlideElementType(this.value);

  String getValue() {
    return value;
  }

  @override
  String toString() {
    return value;
  }

  static SlideElementType fromValue(String value) {
    for (SlideElementType type in SlideElementType.values) {
      if (type.getValue() == value) {
        return type;
      }
    }
    throw ArgumentError("Invalid SlideElementType value: $value");
  }
}
