import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Text("Add Product"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  label: Text("Product Name"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const TextField(
                decoration: InputDecoration(
                  label: Text("Product Name"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              OutlinedButton(onPressed: (){}, child: const Text("Submit"),),
            ],
          ),
        ),
      ),
    );
  }
}
