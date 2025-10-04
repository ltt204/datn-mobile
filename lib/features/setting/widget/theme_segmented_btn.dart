import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datn_mobile/core/theme/theme_controller.dart';

///This class provider segmented button which can be used
///for getting current theme and switching theme
final themeSelectionPod = Provider.autoDispose<Set<ThemeMode>>(
  (ref) => <ThemeMode>{ref.watch(themeControllerProvider)},
  name: "themeSelectionPod",
);

class ThemeSegmentedBtn extends ConsumerStatefulWidget {
  const ThemeSegmentedBtn({super.key});

  @override
  ConsumerState<ThemeSegmentedBtn> createState() => _ThemeSegmentedBtnState();
}

class _ThemeSegmentedBtnState extends ConsumerState<ThemeSegmentedBtn> {
  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: const <ButtonSegment<ThemeMode>>[
        ButtonSegment<ThemeMode>(
          value: ThemeMode.light,
          icon: Icon(Icons.light_mode),
        ),
        ButtonSegment<ThemeMode>(
          value: ThemeMode.dark,
          icon: Icon(Icons.dark_mode),
        ),
        ButtonSegment<ThemeMode>(
          value: ThemeMode.system,
          icon: Icon(Icons.brightness_auto),
        ),
      ],
      selected: ref.watch(themeSelectionPod),
      onSelectionChanged: (thememodes) {
        ref
            .read(themeControllerProvider.notifier)
            .changeTheme(thememodes.first);
      },
      style: const ButtonStyle(
        maximumSize: WidgetStatePropertyAll(Size.fromWidth(12)),
      ),
    );
  }
}
