import 'package:dio/dio.dart';
import 'package:flutter_test_api_widget/models/product_model.dart';
import 'package:flutter_test_api_widget/repos/_base.dart';
import 'package:flutter_test_api_widget/service/rest_api_service.dart';
import 'package:flutter_test_api_widget/utils/exceptions.dart';
import 'package:flutter_test_api_widget/utils/urls.dart';

import '_mixins.dart';

class ProductListRepo extends BaseRepo with MixinHandleDioError {
  /// Downloads the products from the server
  /// 
  Future<List<ProductModel>?> fetchProductsList() async {
    try {
      final response = await RestAPIService().dio.get(APIUrls.productList);
      if (response.data == null) {
        throw AppException(
            msg:
                "Unable to fetch the products from server. Please try again later.");
      }

      if (response.data is! List) {
        throw AppException(
            msg: "The result is not formatted. Please contact us");
      }

      return response.data!
          .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
    } on DioError catch (error) {
      handleDioError(error);
    }
    return null;
  }
}
