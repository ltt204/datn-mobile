import 'package:auto_route/auto_route.dart';
import 'package:datn_mobile/shared/widget/attach_box.dart';
import 'package:datn_mobile/shared/widget/box.dart';
import 'package:datn_mobile/shared/widget/fake_dropdown.dart';
import 'package:datn_mobile/shared/widget/header_bar.dart';
import 'package:datn_mobile/shared/widget/info_dot.dart';
import 'package:datn_mobile/shared/widget/input_card.dart';
import 'package:datn_mobile/shared/widget/labeled.dart';
import 'package:datn_mobile/shared/widget/pill.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key});
  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  String model = 'Fast model';
  String promptStyle = 'Concise';
  final TextEditingController describeCtl = TextEditingController();

  final List<String> chips = const [
    '0 day',
    'Trong tin',
    'Khong biet',
    'Nhu nao',
    'Add',
    'Se la mot vai',
    'Cai example',
    'Add',
  ];

  final Set<String> selected = {};

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? null : const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            HeaderBar(title: 'Presentation', onBack: () {}, onHelp: () {}),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Box(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Options',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 6),
                              InfoDot(onTap: () {}),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Show advanced',
                                  style: TextStyle(
                                    color: cs.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Labeled(
                                  label: 'Model',
                                  child: FakeDropdown<String>(
                                    value: model,
                                    items: const [
                                      'Fast model',
                                      'Balanced model',
                                      'Accurate model',
                                    ],
                                    onChanged: (v) =>
                                        setState(() => model = v!),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Labeled(
                                  label: 'Prompt style',
                                  child: FakeDropdown<String>(
                                    value: promptStyle,
                                    items: const [
                                      'Concise',
                                      'Detailed',
                                      'Creative',
                                    ],
                                    onChanged: (v) =>
                                        setState(() => promptStyle = v!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Describe your presentation',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputCard(
                      controller: describeCtl,
                      hint: 'Describe your video...',
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: chips
                          .map(
                            (c) => Pill(
                              text: (c == 'Add') ? '+ Add' : '+ $c',
                              selected: selected.contains(c),
                              onTap: () {
                                setState(() {
                                  if (selected.contains(c)) {
                                    selected.remove(c);
                                  } else {
                                    selected.add(c);
                                  }
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    AttachBox(onAdd: () {}),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cs.primary,
                    foregroundColor: cs.onPrimary,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: const Text('Generate'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
