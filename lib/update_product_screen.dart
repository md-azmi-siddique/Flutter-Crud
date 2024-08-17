import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
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
          child: Text("Update Product"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
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
                      // return null;
                    } else {
                      // Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "Update",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose(){
    _nameController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
