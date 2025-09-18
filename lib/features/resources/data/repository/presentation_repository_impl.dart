import 'package:datn_mobile/features/resources/domain/entity/presentation.dart';
import 'package:datn_mobile/features/resources/domain/repository/presentation_repository.dart';

class PresentationRepositoryImpl implements PresentationRepository {
  @override
  Future<void> addPresentation(Presentation presentation) {
    // This mapper was created in the presentation_dto.dart as a extension method.
    // PresentationDto presentationDto = presentation.toDto();
    // LOGIC...
    // TODO: implement addBook
    throw UnimplementedError();
  }

  @override
  Future<List<Presentation>> fetchPresentations() {
    // TODO: implement fetchBooks
    throw UnimplementedError();
  }
  // Implementation details would go here
}
