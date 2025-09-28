part of 'controller_provider.dart';

// Query
class PresentationsController extends AsyncNotifier<List<PresentationMinimal>> {
  @override
  Future<List<PresentationMinimal>> build() async {
    final response = await ref
        .read(presentationServiceProvider)
        .fetchPresentations();

    return response;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    final response = await ref
        .read(presentationServiceProvider)
        .fetchPresentations();
    state = await AsyncValue.guard(() => Future.value(response));
  }
}

// Command
class CreatePresentationController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> create(Presentation presentation) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(createPresentationControllerProvider.notifier)
          .create(presentation);
      ref.invalidate(presentationsControllerProvider);
    });
  }
}
