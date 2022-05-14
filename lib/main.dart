import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test_api_widget/screens/home_screen.dart';
import 'package:flutter_test_api_widget/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes(),
      initialRoute: HomeScreen.route,
      builder: EasyLoading.init(),
    );
  }
}
