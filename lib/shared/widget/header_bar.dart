import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final VoidCallback onHelp;
  const HeaderBar({
    super.key,
    required this.title,
    required this.onBack,
    required this.onHelp,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w600);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: const _Glyph(text: '‹', fontSize: 28),
          ),
          const SizedBox(width: 6),
          const Expanded(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Presentation', style: textStyle),
                  SizedBox(width: 4),
                  _Glyph(text: '▾', fontSize: 28),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onHelp,
            child: const _Glyph(text: '？', fontSize: 28),
          ),
        ],
      ),
    );
  }
}

class _Glyph extends StatelessWidget {
  final String text;
  final double fontSize;

  const _Glyph({required this.text, this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      child: Text(text, style: TextStyle(fontSize: fontSize, height: 1.0)),
    );
  }
}
