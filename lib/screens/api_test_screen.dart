import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_api_widget/models/product_model.dart';
import 'package:flutter_test_api_widget/providers/products_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class APITestScreen extends StatefulWidget {
  static const String route = "/api_screen";

  const APITestScreen({Key? key}) : super(key: key);

  @override
  State<APITestScreen> createState() => _APITestScreenState();
}

class _APITestScreenState extends State<APITestScreen> {
  late final ProductsProvider _productsProvider;

  @override
  void initState() {
    _productsProvider = ProductsProvider()
      ..loadProductList(
        onShowError: (msg) => FlutterToast(context).showToast(child: Text(msg)),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: _productsProvider),
        ],
        builder: (context, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Products"),
            ),
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constrains) {
                int crossAxisCount = 2;
                double itemWidth = 150;
                if (constrains.maxWidth > 2 * itemWidth) {
                  crossAxisCount = (constrains.maxWidth / itemWidth).floor();
                }
                return Consumer<ProductsProvider>(
                  builder: (context, provider, child) => GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16)
                        .add(const EdgeInsets.only(bottom: 64)),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) =>
                        _ThisProductWidget(model: provider.productList[index]),
                    itemCount: provider.productList.length,
                  ),
                );
              }),
            ),
          );
        });
  }
}

/// The widget for each product in Gridview
class _ThisProductWidget extends StatelessWidget {
  final ProductModel model;
  const _ThisProductWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CachedNetworkImage(imageUrl: model.image),
          ),
          const SizedBox(height: 8),
          Text(
            model.title,
            maxLines: 2,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            model.description,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
