import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ResourceType {
  final IconData icon;
  final String label;
  final Color color;

  const ResourceType({
    required this.icon,
    required this.label,
    required this.color,
  });

  static List<ResourceType> get allTypes => [
    const ResourceType(
      icon: LucideIcons.fileText,
      label: 'Documents',
      color: Colors.blue,
    ),
    const ResourceType(
      icon: LucideIcons.presentation,
      label: 'Presentations',
      color: Colors.orange,
    ),
    const ResourceType(
      icon: LucideIcons.video,
      label: 'Videos',
      color: Colors.red,
    ),
    const ResourceType(
      icon: LucideIcons.image,
      label: 'Images',
      color: Colors.green,
    ),
    const ResourceType(
      icon: LucideIcons.brainCircuit,
      label: 'Mindmaps',
      color: Colors.purple,
    ),
  ];
}
