import 'package:datn_mobile/features/projects/domain/entity/presentation.dart';
import 'package:datn_mobile/features/projects/domain/entity/presentation_minimal.dart';

abstract interface class PresentationService {
  Future<List<PresentationMinimal>> fetchPresentations();
  Future<void> addPresentation(Presentation presentation);
}
