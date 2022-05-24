import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/api_reponse.dart';

part 'apiService.g.dart';

@RestApi(baseUrl: "https://acangroup.org/aar/mouride24")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/mouride24json.php")
  Future<ApiResponse> getAppDetails();
}