import 'package:crud_operation/add_product_screen.dart';
import 'package:crud_operation/product_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Text("Home"),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: const ProductListScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductScreen(),
            ),
          );
        },
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
