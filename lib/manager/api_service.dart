import 'package:api_version_3_waifu/model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("sfw/waifu")
  Future<AnimeResponse> getWaifu();

  @GET("sfw/neko")
  Future<AnimeResponse> getNeko();

  @GET("sfw/cry")
  Future<AnimeResponse> getCry();

  @GET("sfw/hug")
  Future<AnimeResponse> getHug();

  @GET("sfw/kiss")
  Future<AnimeResponse> getKiss();

  @GET("nsfw/blowjob")
  Future<AnimeResponse> getBlowjob();
}

Dio buildDioClient(String base) {
  final dio = Dio()..options = BaseOptions(baseUrl: base);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  return dio;
}

// https://api.waifu.pics/sfw/lick
