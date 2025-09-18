import 'dart:async';

import 'package:datn_mobile/features/resources/data/dto/presentationd_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'resource_remote_resource.g.dart';

@RestApi()
abstract class ResourceRemoteSource {
  factory ResourceRemoteSource(Dio dio, {String baseUrl}) =
      _ResourceRemoteSource;

  @GET("/books")
  Future<List<PresentationDto>> fetchBooks();

  @POST("/books")
  Future<PresentationDto> createBook(@Body() PresentationDto book);
}
