import 'package:flutter/material.dart';
import 'package:flutter_test_api_widget/screens/api_test_screen.dart';
import 'package:flutter_test_api_widget/screens/home_screen.dart';
import 'package:flutter_test_api_widget/screens/ui_test_screen.dart';

Map<String, WidgetBuilder> appRoutes() => <String, WidgetBuilder>{
      HomeScreen.route: (_) => const HomeScreen(),
      APITestScreen.route: (_) => const APITestScreen(),
      UITestScreen.route: (_) => const UITestScreen(),
    };
