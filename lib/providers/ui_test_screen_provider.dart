import 'package:flutter_test_api_widget/providers/_base.dart';

class EmailNotifProvider extends BaseProvider {
  bool _isActive = false;

  bool get isActive => _isActive;

  set isActive(bool val) {
    _isActive = val;
    notifyListeners();
  }
}
