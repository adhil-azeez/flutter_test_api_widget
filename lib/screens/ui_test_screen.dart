import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test_api_widget/providers/ui_test_screen_provider.dart';
import 'package:flutter_test_api_widget/widgets/app_switch_button.dart';
import 'package:provider/provider.dart';

class UITestScreen extends StatelessWidget {
  static const String route = "/ui_test_screen";
  const UITestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => EmailNotifProvider())
        ],
        builder: (context, _) {
          return Scaffold(
            backgroundColor: const Color(0xFFE9E9E9),
            appBar: AppBar(
              title: const Text("Settings"),
            ),
            body: ListView(
              padding: const EdgeInsets.all(16.0)
                  .add(const EdgeInsets.only(bottom: 64)),
              physics: const BouncingScrollPhysics(),
              children: [
                const Text(
                  "Notification Settings",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                _ThisSwitchLabelWidget(
                  label: "Email Notification",
                  onSwichChanged: (val) =>
                      context.read<EmailNotifProvider>().isActive = val,
                ),
                Consumer<EmailNotifProvider>(
                  builder: (context, provider, child) => AnimatedSize(
                    duration: const Duration(milliseconds: 350),
                    alignment: Alignment.topCenter,
                    child: provider.isActive ? child : Container(),
                  ),
                  child: const _ThisEmailDetailWidget(),
                ),
                const SizedBox(height: 16),
                const _ThisSwitchLabelWidget(label: "Push Notification"),
                const SizedBox(height: 16),
                const _ThisSwitchLabelWidget(label: "Notification at Night"),
              ],
            ),
          );
        });
  }
}

/// The widget that displays email detail switch items like order, shipping, etc
///
class _ThisEmailDetailWidget extends StatelessWidget {
  const _ThisEmailDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(height: 12),
          _ThisSwitchLabelWidget(
            label: "Order Updates",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA7A7A7),
            ),
          ),
          SizedBox(height: 12),
          _ThisSwitchLabelWidget(
            label: "Shipping Updates",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA7A7A7),
            ),
          ),
          SizedBox(height: 12),
          _ThisSwitchLabelWidget(
            label: "Promotions",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA7A7A7),
            ),
          ),
          SizedBox(height: 12),
          _ThisSwitchLabelWidget(
            label: "Offers",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA7A7A7),
            ),
          ),
          SizedBox(height: 12),
          _ThisSwitchLabelWidget(
            label: "News",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA7A7A7),
            ),
          ),
          SizedBox(height: 12),
          _ThisSwitchLabelWidget(
            label: "Messages",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA7A7A7),
            ),
          ),
          SizedBox(height: 12),
          _ThisSwitchLabelWidget(
            label: "New Arrivals",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA7A7A7),
            ),
          ),
        ],
      ),
    );
  }
}

/// The widget displays the [label] and [AppSwitchButton] in a row for ease
class _ThisSwitchLabelWidget extends StatelessWidget {
  final String label;
  final TextStyle style;
  final ValueChanged<bool>? onSwichChanged;
  const _ThisSwitchLabelWidget({
    Key? key,
    required this.label,
    this.onSwichChanged,
    this.style = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF868686),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: style,
          ),
        ),
        AppSwitchButton(
          onChanged: (val) {
            debugPrint("On value Changed $val");
            if (onSwichChanged != null) {
              onSwichChanged!(val);
            }
          },
        ),
      ],
    );
  }
}
