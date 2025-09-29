// ignore_for_file: deprecated_member_use

import 'package:datn_mobile/features/setting/widget/theme_segmented_btn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:datn_mobile/core/local_storage/app_storage_pod.dart';
import 'package:datn_mobile/i18n/strings.g.dart';

import 'package:datn_mobile/shared/pods/internet_checker_pod.dart';
import 'package:datn_mobile/shared/pods/translation_pod.dart';

import '../../../helpers/pump_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Theme Segment Button Test', () {
    late Box appBox;
    setUp(() async {
      appBox = await Hive.openBox('appBox', bytes: Uint8List(0));
    });
    tearDown(() {
      appBox.clear();
    });
    testWidgets('renderes ThemeSegmentBtn', (tester) async {
      final translation = AppLocale.en.buildSync();
      final container = ProviderContainer.test(
        overrides: [
          enableInternetCheckerPod.overrideWith((ref) => false),
          appBoxProvider.overrideWithValue(appBox),
          translationsPod.overrideWith((ref) => translation),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpApp(
        child: const Scaffold(body: ThemeSegmentedBtn()),
        container: container,
      );
      expect(find.byType(ThemeSegmentedBtn), findsOneWidget);
    });
    testWidgets('renderes ThemeSefementBtn with ThemeMode.System at Intial', (
      tester,
    ) async {
      final translation = AppLocale.en.buildSync();
      final container = ProviderContainer.test(
        overrides: [
          enableInternetCheckerPod.overrideWith((ref) => false),
          appBoxProvider.overrideWithValue(appBox),
          translationsPod.overrideWith((ref) => translation),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpApp(
        child: const Scaffold(body: ThemeSegmentedBtn()),
        container: container,
      );
      expect(find.byType(ThemeSegmentedBtn), findsOneWidget);
      expect(find.byIcon(Icons.brightness_auto), findsOneWidget);
      // The segmented button shows a selected state, not a check icon
      final segmentedBtn = tester.widget<SegmentedButton<ThemeMode>>(
        find.byType(SegmentedButton<ThemeMode>),
      );
      expect(segmentedBtn.selected.contains(ThemeMode.system), isTrue);
    });

    testWidgets(
      'renderes ThemeSefementBtn with ThemeMode.light on select light mode',
      (tester) async {
        final translation = AppLocale.en.buildSync();
        final container = ProviderContainer.test(
          overrides: [
            enableInternetCheckerPod.overrideWith((ref) => false),
            appBoxProvider.overrideWithValue(appBox),
            translationsPod.overrideWith((ref) => translation),
          ],
        );
        addTearDown(container.dispose);

        await tester.pumpApp(
          child: const Scaffold(body: ThemeSegmentedBtn()),
          container: container,
        );
        expect(find.byType(ThemeSegmentedBtn), findsOneWidget);
        expect(find.byIcon(Icons.light_mode), findsOneWidget);
        await tester.tap(find.byIcon(Icons.light_mode));
        await tester.pumpAndSettle();
        expect(container.read(themeSelectionPod).length, 1);
        expect(container.read(themeSelectionPod), equals({ThemeMode.light}));
      },
    );
    testWidgets(
      'renderes ThemeSefementBtn with ThemeMode.dark on select dark mode',
      (tester) async {
        final translation = AppLocale.en.buildSync();
        final container = ProviderContainer.test(
          overrides: [
            enableInternetCheckerPod.overrideWith((ref) => false),
            appBoxProvider.overrideWithValue(appBox),
            translationsPod.overrideWith((ref) => translation),
          ],
        );
        addTearDown(container.dispose);

        await tester.pumpApp(
          child: const Scaffold(body: ThemeSegmentedBtn()),
          container: container,
        );
        expect(find.byType(ThemeSegmentedBtn), findsOneWidget);
        expect(find.byIcon(Icons.dark_mode), findsOneWidget);
        await tester.tap(find.byIcon(Icons.dark_mode));
        await tester.pumpAndSettle();
        expect(container.read(themeSelectionPod).length, 1);
        expect(container.read(themeSelectionPod), equals({ThemeMode.dark}));
      },
    );
    testWidgets(
      'renderes ThemeSegementBtn with ThemeMode.system after change from dark mode to system mode',
      (tester) async {
        final translation = AppLocale.en.buildSync();
        final container = ProviderContainer.test(
          overrides: [
            enableInternetCheckerPod.overrideWith((ref) => false),
            appBoxProvider.overrideWithValue(appBox),
            translationsPod.overrideWith((ref) => translation),
          ],
        );
        addTearDown(container.dispose);

        await tester.pumpApp(
          child: const Scaffold(body: ThemeSegmentedBtn()),
          container: container,
        );
        expect(find.byType(ThemeSegmentedBtn), findsOneWidget);
        expect(find.byIcon(Icons.dark_mode), findsOneWidget);
        expect(find.byIcon(Icons.brightness_auto), findsOneWidget);

        await tester.tap(find.byIcon(Icons.dark_mode));
        await tester.pumpAndSettle();
        expect(container.read(themeSelectionPod).length, 1);
        expect(container.read(themeSelectionPod), equals({ThemeMode.dark}));

        await tester.tap(find.byIcon(Icons.brightness_auto));
        await tester.pumpAndSettle();
        expect(container.read(themeSelectionPod).length, 1);
        expect(container.read(themeSelectionPod), equals({ThemeMode.system}));
      },
    );
    testWidgets(
      'renderes ThemeSegementBtn with ThemeMode.system after change from light mode to system mode',
      (tester) async {
        final translation = AppLocale.en.buildSync();
        final container = ProviderContainer.test(
          overrides: [
            enableInternetCheckerPod.overrideWith((ref) => false),
            appBoxProvider.overrideWithValue(appBox),
            translationsPod.overrideWith((ref) => translation),
          ],
        );
        addTearDown(container.dispose);

        await tester.pumpApp(
          child: const Scaffold(body: ThemeSegmentedBtn()),
          container: container,
        );
        expect(find.byType(ThemeSegmentedBtn), findsOneWidget);
        expect(find.byIcon(Icons.light_mode), findsOneWidget);
        expect(find.byIcon(Icons.brightness_auto), findsOneWidget);

        await tester.tap(find.byIcon(Icons.light_mode));
        await tester.pumpAndSettle();
        expect(container.read(themeSelectionPod).length, 1);
        expect(container.read(themeSelectionPod), equals({ThemeMode.light}));

        await tester.tap(find.byIcon(Icons.brightness_auto));
        await tester.pumpAndSettle();
        expect(container.read(themeSelectionPod).length, 1);
        expect(container.read(themeSelectionPod), equals({ThemeMode.system}));
      },
    );
    testWidgets(
      'renderes ThemeSegementBtn with ThemeMode.dark after change from light mode to dark mode',
      (tester) async {
        final translation = AppLocale.en.buildSync();
        final container = ProviderContainer.test(
          overrides: [
            enableInternetCheckerPod.overrideWith((ref) => false),
            appBoxProvider.overrideWithValue(appBox),
            translationsPod.overrideWith((ref) => translation),
          ],
        );
        addTearDown(container.dispose);

        await tester.pumpApp(
          child: const Scaffold(body: ThemeSegmentedBtn()),
          container: container,
        );
        expect(find.byType(ThemeSegmentedBtn), findsOneWidget);
        expect(find.byIcon(Icons.light_mode), findsOneWidget);
        expect(find.byIcon(Icons.dark_mode), findsOneWidget);

        await tester.tap(find.byIcon(Icons.light_mode));
        await tester.pumpAndSettle();
        expect(container.read(themeSelectionPod).length, 1);
        expect(container.read(themeSelectionPod), equals({ThemeMode.light}));

        await tester.tap(find.byIcon(Icons.dark_mode));
        await tester.pumpAndSettle();
        expect(container.read(themeSelectionPod).length, 1);
        expect(container.read(themeSelectionPod), equals({ThemeMode.dark}));
      },
    );
  });
}
