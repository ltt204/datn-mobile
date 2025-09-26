import 'package:datn_mobile/features/projects/data/dto/presentation_dto.dart';
import 'package:datn_mobile/features/projects/data/dto/presentation_minimal_dto.dart';
import 'package:datn_mobile/features/projects/data/source/resource_remote_source.dart';
import 'package:datn_mobile/features/projects/domain/entity/presentation.dart';
import 'package:datn_mobile/features/projects/domain/entity/presentation_minimal.dart';
import 'package:datn_mobile/features/projects/domain/repository/presentation_repository.dart';

class PresentationRepositoryImpl implements PresentationRepository {
  final ResourceRemoteSource _remoteSource;
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
  }

  // Implementation details would go here
}
