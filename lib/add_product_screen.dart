import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Text("Add Product"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Proper Field Required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Product Name", hintText: 'Eg: Egg'),
                  maxLength: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _quantityController,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Proper Field Required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Quantity', hintText: 'Eg: 10'),
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _descriptionController,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Proper Field Required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Description",
                    hintText: 'Lorem Ipsul',
                  ),
                  maxLength: 100,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addProduct();
                    }
                  },
                  child: const Text(
                    "Add",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addProduct() async {
    // print("object");
    //POST
    const String addNewURI = 'https://crud.teamrabbil.com/api/v1/CreateProduct';
    Map<String, dynamic> inputData = {
      // key : value
    };
    Uri uri = Uri.parse(addNewURI);
    Response response = await post(uri,
        body: jsonEncode(inputData),
        headers: {'content-type': 'application/json'});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
