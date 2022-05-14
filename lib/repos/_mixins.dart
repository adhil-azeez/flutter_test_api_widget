import 'package:dio/dio.dart';
import 'package:flutter_test_api_widget/repos/_base.dart';
import 'package:flutter_test_api_widget/utils/exceptions.dart';

mixin MixinHandleDioError on BaseRepo {
  void handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
        throw AppException(
          msg: "Couldn't connect to server. Please check your connection.",
          exception: error,
        );

      case DioErrorType.response:
        throw AppException(
          msg: "Unable to process the result. Please try again later.",
          exception: error,
        );
      case DioErrorType.cancel:
        throw AppException(
          msg: "User cancelled the request",
          exception: error,
        );
      case DioErrorType.other:
        throw AppException(
          msg: error.message,
          exception: error,
        );
    }
  }
}
