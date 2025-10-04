import 'package:auto_route/auto_route.dart';
import 'package:datn_mobile/core/router/router_pod.dart';
import 'package:datn_mobile/features/setting/widget/profile_picture.dart';
import 'package:datn_mobile/features/setting/widget/setting_option.dart';
import 'package:datn_mobile/features/setting/widget/setting_section.dart';
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
    return Consumer(
      builder: (context, ref, child) {
        final t = ref.watch(translationsPod);
        final autorouter = ref.watch(autorouterProvider);
        return Scaffold(
          appBar: AppBar(
            title: const SettingAppBarTitle(),
            actions: const [AppLocalePopUp()],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SettingProfilePicture(),
                const SizedBox(height: 20),
                SettingSection(
                  title: t.accountSetting,
                  options: [
                    SettingOption(
                      title: t.personalInformation,
                      nextPage: '/change-password',
                    ),
                    SettingOption(
                      title: t.passwordAndSecurity,
                      nextPage: '/privacy-settings',
                    ),
                    SettingOption(
                      title: t.paymentMethods,
                      nextPage: '/notification-settings',
                    ),
                  ],
                ),
                const SettingSection(
                  title: 'App Settings',
                  options: [
                    SettingOption(
                      title: 'Notifications',
                      nextPage: '/change-password',
                    ),
                    SettingOption(
                      title: 'Language',
                      nextPage: '/privacy-settings',
                    ),
                    SettingOption(
                      title: 'Theme',
                      nextPage: '/notification-settings',
                    ),
                  ],
                ),
                const SettingSection(
                  title: 'Support',
                  options: [
                    SettingOption(
                      title: 'Help Center',
                      nextPage: '/change-password',
                    ),
                    SettingOption(
                      title: 'Contact Us',
                      nextPage: '/privacy-settings',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Log Out',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const ThemeSegmentedBtn(),
                ElevatedButton(
                  onPressed: () {
                    autorouter.pushPath('/settings');
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
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

class SettingProfilePicture extends StatelessWidget {
  const SettingProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        ProfilePicture(size: 120),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Icon(Icons.camera_alt, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
