part of 'repository_provider.dart';

class PresentationRepositoryImpl implements PresentationRepository {
  final ProjectsRemoteSource _remoteSource;
  PresentationRepositoryImpl(this._remoteSource);

  @override
  Future<void> addPresentation(Presentation presentation) {
    // This mapper was created in the presentation_dto.dart as a extension method.
    // PresentationDto presentationDto = presentation.toDto();
    // LOGIC...
    _remoteSource.createPresentation(presentation.toDto());
    // TODO: implement addBook
    throw UnimplementedError();
  }

  @override
  Future<List<PresentationMinimal>> fetchPresentations() async {
    final dtoResponse = await _remoteSource.fetchPresentations();

    return dtoResponse.data?.map((dto) => dto.toEntity()).toList() ?? [];
    // Implementation details would go here
  }
}
