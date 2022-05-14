import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test_api_widget/providers/_base.dart';

mixin MixinLoadingProvider on BaseProvider {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();

    if (val) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
  }
}
