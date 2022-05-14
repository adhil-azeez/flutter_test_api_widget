import 'package:flutter_test_api_widget/models/product_model.dart';
import 'package:flutter_test_api_widget/providers/_base.dart';
import 'package:flutter_test_api_widget/repos/product_list_repo.dart';
import 'package:flutter_test_api_widget/utils/exceptions.dart';

import '_mixins.dart';

class ProductsProvider extends BaseProvider with MixinLoadingProvider {
  final _productsList = <ProductModel>[];
  final ProductListRepo _repo = ProductListRepo();

  List<ProductModel> get productList => _productsList;

  /// Load the products from api service and bind into [productList]
  void loadProductList({OnShowError? onShowError}) async {
    isLoading = true;
    try {
      final products = await _repo.fetchProductsList();
      _productsList.clear();
      if (products != null) {
        _productsList.addAll(products);
      }
    } on AppException catch (ex) {
      if (onShowError != null) {
        onShowError(ex.toString());
      }
    } catch (ex) {
      if (onShowError != null) {
        onShowError(ex.toString());
      }
    } finally {
      isLoading = false;
    }
  }
}
