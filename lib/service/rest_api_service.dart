import 'package:dio/dio.dart';

class RestAPIService {
  static final RestAPIService _instance = RestAPIService._initialise();

  final Dio dio;

  RestAPIService._initialise()
      : dio = Dio()
          ..interceptors.add(LogInterceptor(
            responseBody: true,
          ));

  factory RestAPIService() => _instance;

}
