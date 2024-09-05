
import 'package:flutter/material.dart';
import 'package:flutter_crud/style/style.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  Map<String, dynamic> FormValues = {
    "ProductName": "",
    "ProductCode": "",
    "Img": "",
    "UnitPrice": "",
    "Qty": "",
    "TotalPrice": "",
  };

  InputOnChange(mapKey, textValue){
    setState(() {
      FormValues.update(mapKey, (value)=> textValue);
    });

  }

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
                    onChanged: (textValue) {
                      InputOnChange("ProductName", textValue);
                    },
                    decoration: AppInputDecoration("Product Name"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (textValue) {
                      InputOnChange("ProductCode", textValue);
                    },
                    decoration: AppInputDecoration("Product Code"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (textValue) {
                      InputOnChange("Img", textValue);
                    },
                    decoration: AppInputDecoration("Product Image"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (textValue) {
                      InputOnChange("UnitPrice", textValue);
                    },
                    decoration: AppInputDecoration("Unit Price"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (textValue) {
                      InputOnChange("TotalPrice", textValue);
                    },
                    decoration: AppInputDecoration("Total Price"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppDropDown(
                    DropdownButton(
                      value: FormValues['Qty'],
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
                      onChanged: (textValue) {
                        InputOnChange("Qty", textValue);
                      },
                      isExpanded: true,
                      underline: Container(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () {},
                      child: SuccessButton('Submit'),
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
