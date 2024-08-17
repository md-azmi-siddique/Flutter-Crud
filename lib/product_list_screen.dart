import 'package:crud_operation/update_product_screen.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
    );
  }
  void _showDeleteConfirmationDialog(){
    // print("Button is pressing");
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text("Hello"),
        content: const Text("kkkk"),
        actions: [
          TextButton(onPressed: (){}, child: const Text("Yes"),),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("No"),),
        ],
      );
    });
  }
}
