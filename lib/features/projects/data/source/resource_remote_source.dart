import 'dart:async';

import 'package:datn_mobile/features/projects/data/dto/presentation_dto.dart';
import 'package:datn_mobile/features/projects/data/dto/presentation_minimal_dto.dart';
import 'package:datn_mobile/shared/api_client/response_dto/server_reponse_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'resource_remote_source.g.dart';

@RestApi()
abstract class ResourceRemoteSource {
  factory ResourceRemoteSource(Dio dio, {String baseUrl}) =
      _ResourceRemoteSource;

  @GET("/presentations")
  Future<ServerResponseDto<List<PresentationMinimalDto>>> fetchPresentations();

  @POST("/presentations")
  Future<PresentationDto> createPresentation(
    @Body() PresentationDto presentation,
  );
}
