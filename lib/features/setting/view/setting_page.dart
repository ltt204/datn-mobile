import 'package:auto_route/annotations.dart';
import 'package:datn_mobile/features/setting/widget/profile_picture.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datn_mobile/features/setting/widget/theme_segmented_btn.dart';
import 'package:datn_mobile/shared/widget/app_locale_popup.dart';
import 'package:datn_mobile/shared/pods/translation_pod.dart';

@RoutePage()
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingView();
  }
}

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SettingAppBarTitle(),
        actions: const [
          AppLocalePopUp(),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ProfilePicture(size: 120),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            ThemeSegmentedBtn(),
          ],
        ),
      ),
    );
  }
}

class SettingAppBarTitle extends ConsumerWidget {
  const SettingAppBarTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsPod);
    return Text(t.settingAppBarTitle);
  }
}
