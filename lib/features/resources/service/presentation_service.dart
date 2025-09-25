import 'package:datn_mobile/features/resources/data/dto/presentation_minimal_dto.dart';
import 'package:datn_mobile/features/resources/domain/entity/presentation.dart';
import 'package:datn_mobile/features/resources/domain/repository/presentation_repository.dart';
import 'package:datn_mobile/shared/api_client/response_dto/server_reponse_dto.dart';

class PresentationService {
  final PresentationRepository _repo;
  PresentationService(this._repo);

  Future<ServerResponseDto<List<PresentationMinimalDto>>> getPresentations() {
    return _repo.fetchPresentations();
  }

  Future<void> addPresentation(Presentation presentation) {
    // Additional validations or logics
    return _repo.addPresentation(presentation);
  }
}
