// di bridge
import 'package:datn_mobile/features/resources/data/repository/presentation_repository_impl.dart';
import 'package:datn_mobile/features/resources/domain/entity/presentation.dart';
import 'package:datn_mobile/features/resources/domain/repository/presentation_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final presentationRepositoryProvider =
    Provider<PresentationRepository>((ref) => PresentationRepositoryImpl());

// query
final presentationsControllerProvider =
    AsyncNotifierProvider<PresentationsController, List<Presentation>>(
        () => PresentationsController());

class PresentationsController extends AsyncNotifier<List<Presentation>> {
  @override
  Future<List<Presentation>> build() =>
      ref.read(presentationRepositoryProvider).fetchPresentations();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(presentationRepositoryProvider).fetchPresentations(),
    );
  }
}

// command
final createPresentationControllerProvider =
    AsyncNotifierProvider<CreatePresentationController, void>(
        () => CreatePresentationController());

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
