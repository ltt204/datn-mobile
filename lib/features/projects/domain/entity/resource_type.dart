import 'package:flutter/material.dart';

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
      icon: Icons.description_outlined,
      label: 'Documents',
      color: Colors.blue,
    ),
    const ResourceType(
      icon: Icons.slideshow_outlined,
      label: 'Presentations',
      color: Colors.orange,
    ),
    const ResourceType(
      icon: Icons.videocam_outlined,
      label: 'Videos',
      color: Colors.red,
    ),
    const ResourceType(
      icon: Icons.image_outlined,
      label: 'Images',
      color: Colors.green,
    ),
    const ResourceType(
      icon: Icons.account_tree_outlined,
      label: 'Mindmaps',
      color: Colors.purple,
    ),
  ];
}
