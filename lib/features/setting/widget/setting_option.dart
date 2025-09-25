import 'package:flutter/material.dart';

class SettingOption extends StatelessWidget {
  const SettingOption({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.onTap,
    this.nextPage,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onTap;
  final String? nextPage;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: icon != null
          ? Icon(icon, size: 24, color: Theme.of(context).primaryColor)
          : null,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            )
          : null,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap:
          onTap ??
          () {
            if (nextPage != null) {
              Navigator.pushNamed(context, nextPage!);
            }
          },
    );
  }
}
