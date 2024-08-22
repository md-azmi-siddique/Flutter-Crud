import 'dart:convert';
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
  List<Product> productList = [];

  @override
  void initState() {
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
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(productList[index].productName), // Use actual product name
            subtitle: Wrap(
              spacing: 20,
              children: [
                Text('Price: ${productList[index].price}'), // Use actual price
                Text('ID: ${productList[index].id.toString()}'), // Use actual ID
              ],
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

    productList.clear();
    const String getProductUrl = "http://10.0.2.2:8000/api/products/";
    Uri uri = Uri.parse(getProductUrl);

    try {
      Response response = await get(uri);

      if (response.statusCode == 200) {
        print("Data found successfully");
        final List<dynamic> decodedData = json.decode(response.body);
        print(decodedData);

        // Iterate through the decoded JSON list
        for (var p in decodedData) {
          // Ensure that each product is a Map<String, dynamic>
          if (p is Map<String, dynamic>) {
            int id = int.tryParse(p['id'].toString()) ?? 0;
            String productName = p['productName'] ?? '';
            String price = p['price'].toString();  // Ensuring price is treated as a String
            String img = p['img'] ?? '';

            // Create a Product object and add it to the list
            Product product = Product(id, productName, price, img);
            productList.add(product);
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to load products")),
        );
      }
    } catch (e) {
      print("Error fetching products: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error fetching products")),
      );
    }

    _getProductListProgress = false;
    setState(() {});
  }


  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this product?"),
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
      },
    );
  }
}

class Product {
  final int id;
  final String productName;
  final String price;
  final String img;

  Product(this.id, this.productName, this.price, this.img);
}
