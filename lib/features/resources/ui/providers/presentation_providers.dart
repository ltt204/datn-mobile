// di bridge
import 'package:datn_mobile/features/resources/data/dto/presentation_minimal_dto.dart';
import 'package:datn_mobile/features/resources/data/repository/presentation_repository_impl.dart';
import 'package:datn_mobile/features/resources/data/source/resource_remote_source_provider.dart';
import 'package:datn_mobile/features/resources/domain/entity/presentation.dart';
import 'package:datn_mobile/features/resources/domain/repository/presentation_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final presentationRepositoryProvider = Provider<PresentationRepository>(
  (ref) => PresentationRepositoryImpl(ref.read(resourceRemoteSourceProvider)),
);

// Query
final presentationsControllerProvider =
    AsyncNotifierProvider<
      PresentationsController,
      List<PresentationMinimalDto>
    >(() => PresentationsController());

class PresentationsController
    extends AsyncNotifier<List<PresentationMinimalDto>> {
  @override
  Future<List<PresentationMinimalDto>> build() async {
    final response = await ref
        .read(presentationRepositoryProvider)
        .fetchPresentations();

    return response.data ?? List.empty();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    final response = await ref
        .read(presentationRepositoryProvider)
        .fetchPresentations();
    final data = response.data ?? List.empty();
    state = await AsyncValue.guard(() => Future.value(data));
  }
}

// command
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
