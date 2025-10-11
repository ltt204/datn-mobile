import 'package:flutter/material.dart';
import 'package:datn_mobile/shared/widget/box.dart';
import 'package:datn_mobile/shared/widget/info_dot.dart';
import 'package:datn_mobile/shared/widget/option_field.dart';

class ExpandableBox extends StatefulWidget {
  final String title;
  final List<OptionRow> collapsedOptions;
  final List<OptionRow>? expandedOptions;
  final bool showInfoDot;
  final VoidCallback? onInfoTap;
  final bool initiallyExpanded;

  const ExpandableBox({
    super.key,
    required this.title,
    required this.collapsedOptions,
    this.expandedOptions,
    this.showInfoDot = true,
    this.onInfoTap,
    this.initiallyExpanded = false,
  });

  @override
  State<ExpandableBox> createState() => _ExpandableBoxState();
}

class _ExpandableBoxState extends State<ExpandableBox>
    with SingleTickerProviderStateMixin {
  late bool isExpanded;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    if (isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Box(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              if (widget.showInfoDot) ...[
                const SizedBox(width: 6),
                InfoDot(onTap: widget.onInfoTap ?? () {}),
              ],
              const Spacer(),
              GestureDetector(
                onTap: widget.expandedOptions != null ? _toggleExpanded : null,
                child: widget.expandedOptions != null
                    ? Text(
                        isExpanded ? 'Hide advanced' : 'Show advanced',
                        style: TextStyle(
                          color: cs.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...widget.collapsedOptions.map(
            (row) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: row.build(context),
            ),
          ),
          if (widget.expandedOptions != null)
            SizeTransition(
              sizeFactor: _expandAnimation,
              axisAlignment: -1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.expandedOptions!
                    .map(
                      (row) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: row.build(context),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
