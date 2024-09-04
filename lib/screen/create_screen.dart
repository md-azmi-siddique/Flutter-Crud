import 'package:crud_flutter/style/style.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Product"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration("Product Name"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration("Product Code"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration("Product Image"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration("unit Price"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration("Total Price"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppDropDown(
                    DropdownButton(
                      value: "",
                      items: [
                        DropdownMenuItem(
                          child: Text('Select Qty'),
                          value: '',
                        ),
                        DropdownMenuItem(
                          child: Text('1'),
                          value: '1',
                        ),
                        DropdownMenuItem(
                          child: Text('2'),
                          value: '2',
                        ),
                        DropdownMenuItem(
                          child: Text('3'),
                          value: '3',
                        ),
                      ],
                      onChanged: (value) {},
                      isExpanded: true,
                      underline: Container(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Add Item'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
