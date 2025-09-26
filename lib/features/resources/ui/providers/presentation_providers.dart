// di bridge
import 'package:datn_mobile/features/resources/data/repository/presentation_repository_impl.dart';
import 'package:datn_mobile/features/resources/data/source/resource_remote_source_provider.dart';
import 'package:datn_mobile/features/resources/domain/entity/presentation.dart';
import 'package:datn_mobile/features/resources/domain/entity/presentation_minimal.dart';
import 'package:datn_mobile/features/resources/domain/repository/presentation_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final presentationRepositoryProvider = Provider<PresentationRepository>(
  (ref) => PresentationRepositoryImpl(ref.read(resourceRemoteSourceProvider)),
);

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
