import 'package:datn_mobile/features/resources/data/source/resource_remote_source.dart';
import 'package:datn_mobile/shared/api_client/dio/dio_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resourceRemoteSourceProvider = Provider<ResourceRemoteSource>((ref) {
  return ResourceRemoteSource(ref.read(dioProvider));
});
