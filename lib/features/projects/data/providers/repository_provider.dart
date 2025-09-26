import 'package:datn_mobile/features/projects/data/repository/presentation_repository_impl.dart';
import 'package:datn_mobile/features/projects/data/source/resource_remote_source_provider.dart';
import 'package:datn_mobile/features/projects/domain/repository/presentation_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final presentationRepositoryProvider = Provider<PresentationRepository>(
  (ref) => PresentationRepositoryImpl(ref.read(resourceRemoteSourceProvider)),
);
