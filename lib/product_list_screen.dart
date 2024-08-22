import 'package:crud_operation/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool _getProductListProgress = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProduct();
  }

  Widget build(BuildContext context) {
    return Visibility(
      visible: _getProductListProgress == false,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.separated(
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text("Product Name"),
            subtitle: const Wrap(
              spacing: 20,
              children: [Text("data"), Text("data")],
            ),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UpdateProductScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                  color: Colors.green,
                ),
                IconButton(
                  onPressed: _showDeleteConfirmationDialog,
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }

  Future<void> _getProduct() async {
    _getProductListProgress = true;
    setState(() {});
    const String getProductUrl = "http://127.0.0.1:8000/api/products/";
    Uri uri = Uri.parse(getProductUrl);
    Response response = await get(uri);
  }

  void _showDeleteConfirmationDialog() {
    // print("Button is pressing");
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Hello"),
            content: const Text("kkkk"),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No"),
              ),
            ],
          );
        });
  }
}
