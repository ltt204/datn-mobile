import 'package:datn_mobile/features/resources/domain/entity/presentation.dart';
import 'package:datn_mobile/features/resources/domain/entity/presentation_minimal.dart';

abstract class PresentationRepository {
  Future<List<PresentationMinimal>> fetchPresentations();
  Future<void> addPresentation(Presentation presentation);
}
