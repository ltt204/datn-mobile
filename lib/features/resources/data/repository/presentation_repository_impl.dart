import 'package:datn_mobile/features/resources/data/dto/presentation_dto.dart';
import 'package:datn_mobile/features/resources/data/dto/presentation_minimal_dto.dart';
import 'package:datn_mobile/features/resources/data/source/resource_remote_source.dart';
import 'package:datn_mobile/features/resources/domain/entity/presentation.dart';
import 'package:datn_mobile/features/resources/domain/repository/presentation_repository.dart';
import 'package:datn_mobile/shared/api_client/response_dto/server_reponse_dto.dart';

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
  Future<ServerResponseDto<List<PresentationMinimalDto>>> fetchPresentations() {
    return _remoteSource.fetchPresentations();
  }

  // Implementation details would go here
}
