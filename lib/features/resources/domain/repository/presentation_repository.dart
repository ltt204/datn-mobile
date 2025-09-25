import 'package:datn_mobile/features/resources/data/dto/presentation_minimal_dto.dart';
import 'package:datn_mobile/features/resources/domain/entity/presentation.dart';
import 'package:datn_mobile/shared/api_client/response_dto/server_reponse_dto.dart';

abstract class PresentationRepository {
  Future<ServerResponseDto<List<PresentationMinimalDto>>> fetchPresentations();
  Future<void> addPresentation(Presentation presentation);
}
