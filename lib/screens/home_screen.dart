import 'package:flutter/material.dart';
import 'package:flutter_test_api_widget/screens/api_test_screen.dart';
import 'package:flutter_test_api_widget/screens/ui_test_screen.dart';

/// The main screen of the app.
///
/// The screen contains 2 buttons to navigate for API test and UI test
class HomeScreen extends StatelessWidget {
  static const String route = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              "Flutter Test",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () => _onTapAPI(context),
                child: const Text("API TEST")),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () => _onTapUI(context),
                child: const Text("UI TEST")),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  /// The method will navigate to
  void _onTapAPI(BuildContext context) =>
      Navigator.of(context).pushNamed(APITestScreen.route);

  void _onTapUI(BuildContext context) =>
      Navigator.of(context).pushNamed(UITestScreen.route);
}
