import 'package:datn_mobile/features/resources/domain/entity/presentation.dart';

abstract class PresentationRepository {
  Future<List<Presentation>> fetchPresentations();
  Future<void> addPresentation(Presentation presentation);
}
