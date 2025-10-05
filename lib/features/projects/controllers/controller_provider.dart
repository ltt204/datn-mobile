import 'package:datn_mobile/features/projects/domain/entity/presentation_minimal.dart';
import 'package:datn_mobile/features/projects/service/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:datn_mobile/features/projects/domain/entity/presentation.dart';

part 'presentation_controller.dart';

final presentationsControllerProvider =
    AsyncNotifierProvider<PresentationsController, List<PresentationMinimal>>(
      () => PresentationsController(),
    );

final createPresentationControllerProvider =
    AsyncNotifierProvider<CreatePresentationController, void>(
      () => CreatePresentationController(),
    );
