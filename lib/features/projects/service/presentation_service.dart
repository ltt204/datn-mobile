import 'package:datn_mobile/features/projects/domain/entity/presentation.dart';
import 'package:datn_mobile/features/projects/domain/entity/presentation_minimal.dart';
import 'package:datn_mobile/features/projects/domain/repository/presentation_repository.dart';

class PresentationService {
  final PresentationRepository _repo;
  PresentationService(this._repo);

  Future<List<PresentationMinimal>> getPresentations() {
    return _repo.fetchPresentations();
  }

  Future<void> addPresentation(Presentation presentation) {
    // Additional validations or logics
    return _repo.addPresentation(presentation);
  }
}
