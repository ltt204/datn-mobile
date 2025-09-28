import 'package:datn_mobile/features/projects/data/repository/repository_provider.dart';
import 'package:datn_mobile/features/projects/domain/service/presentation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datn_mobile/features/projects/domain/entity/presentation.dart';
import 'package:datn_mobile/features/projects/domain/entity/presentation_minimal.dart';
import 'package:datn_mobile/features/projects/domain/repository/presentation_repository.dart';

part 'presentation_service_impl.dart';

final presentationServiceProvider = Provider<PresentationService>((ref) {
  return PresentationServiceImpl(ref.read(presentationRepositoryProvider));
});
