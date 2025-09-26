// di bridge
import 'package:datn_mobile/features/projects/data/providers/repository_provider.dart';
import 'package:datn_mobile/features/projects/domain/entity/presentation.dart';
import 'package:datn_mobile/features/projects/domain/entity/presentation_minimal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Query
final presentationsControllerProvider =
    AsyncNotifierProvider<PresentationsController, List<PresentationMinimal>>(
      () => PresentationsController(),
    );

class PresentationsController extends AsyncNotifier<List<PresentationMinimal>> {
  @override
  Future<List<PresentationMinimal>> build() async {
    final response = await ref
        .read(presentationRepositoryProvider)
        .fetchPresentations();

    return response;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    final response = await ref
        .read(presentationRepositoryProvider)
        .fetchPresentations();
    state = await AsyncValue.guard(() => Future.value(response));
  }
}

// Command
final createPresentationControllerProvider =
    AsyncNotifierProvider<CreatePresentationController, void>(
      () => CreatePresentationController(),
    );

class CreatePresentationController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> create(Presentation presentation) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(presentationRepositoryProvider)
          .addPresentation(presentation);
      await ref.read(presentationsControllerProvider.notifier).refresh();
    });
  }
}
