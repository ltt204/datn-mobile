import 'package:datn_mobile/i18n/strings.g.dart';
import 'package:flutter_riverpod/legacy.dart';

final translationsPod = StateProvider<Translations>(
  (ref) => throw UnimplementedError(
    "translations not overriden yet",
  ),
  name: 'translationsProvider',
);
