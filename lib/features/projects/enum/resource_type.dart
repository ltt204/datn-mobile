import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum ResourceType {
  image(value: "image", lucideIcon: LucideIcons.image),
  presentation(value: 'presentation', lucideIcon: LucideIcons.presentation),
  mindmap(value: 'mindmap', lucideIcon: LucideIcons.brainCircuit);

  final String value;
  final IconData lucideIcon;

  const ResourceType({required this.value, required this.lucideIcon});

  String getValue() {
    return value;
  }

  @override
  String toString() {
    return value;
  }

  static ResourceType fromValue(String value) {
    for (ResourceType type in ResourceType.values) {
      if (type.getValue() == value) {
        return type;
      }
    }
    throw ArgumentError("Invalid ResourceType value: $value");
  }
}
