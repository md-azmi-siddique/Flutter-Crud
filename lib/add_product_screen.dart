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
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _addNewProductInProgress = false;

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
                  controller: _priceController,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Proper Field Required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Price', hintText: 'Eg: 10'),
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
                Visibility(
                  visible: _addNewProductInProgress == false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('add product');
                        _addProduct();
                      }
                    },
                    child: const Text(
                      "Add",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addProduct() async {
    _addNewProductInProgress = true;
    setState(() {});
    print('dhukse');
    // const String addNewURI = 'http://localhost:8000/api/products/create';
    const String addNewURI = 'http://10.0.2.2:8000/api/products/create/';
    print('dhukse');
    Map<String, dynamic> inputData = {
      'productName': _nameController.text,
      'price': _priceController.text,
      'img': _descriptionController.text
    };
    Uri uri = Uri.parse(addNewURI);
    try {
      Response response = await post(
        uri,
        body: jsonEncode(inputData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        // Handle successful response
        _showSuccessDialogMassage();
        _nameController.clear();
        _priceController.clear();
        _descriptionController.clear();
        print('Product added successfully');
      } else {
        _showErrorDialogMassage();
        // Handle error response
        print('Failed to add product: ${response.statusCode}');
      }
    } catch (e) {
      _showErrorDialogMassage();
      print('Error occurred: $e');
    }

    _addNewProductInProgress = false;
    setState(() {});
  }

  void _showErrorDialogMassage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Failed to Upload"),
            content: const Text("Network Issue, Please Try again"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }

  void _showSuccessDialogMassage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Upload"),
            content: const Text("Upload Successfully"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
