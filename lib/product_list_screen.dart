import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return  ListTile(
          title: const Text("Product Name"),
          subtitle: const Wrap(
            spacing: 20,
            children: [
              Text("data"),
              Text("data")
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.edit), color: Colors.green,),
              IconButton(onPressed: (){}, icon: const Icon(Icons.delete), color: Colors.red,),
            ],
          ),
        );
      },
    );
  }
}
