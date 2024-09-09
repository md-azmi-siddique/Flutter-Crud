import 'package:flutter/material.dart';
import 'package:flutter_crud/rest_api/rest_client.dart';
import 'package:flutter_crud/style/style.dart';

class CreateScreenNew extends StatefulWidget {
  const CreateScreenNew({super.key});

  @override
  State<CreateScreenNew> createState() => _CreateScreenNewState();
}

class _CreateScreenNewState extends State<CreateScreenNew> {

  Map<String, dynamic> formValues = {
    "productName": "",
    "price": "",
    "img": "",
  };

  bool loading = false;


  inputOnChange(mapKey, textValue) {
    setState(
          () {
        formValues.update(mapKey, (value) => textValue);
      },
    );
  }


  formOnSubmit() async {
    if(formValues['productName'].isEmpty){
      // Handle empty ProductName
      errorToast("Product Name Missing");
    }
    else if(formValues['price'].isEmpty){
      // Handle empty ProductName
      errorToast("Product Price Missing");
    }
    else if(formValues['img'].isEmpty){
      // Handle empty ProductName
      errorToast("Product Image Missing");
    }
    else{
      // successToast("Al Good");
      setState(() {
        loading = true;
      });
      await productCreateRequest(formValues);
      setState(() {
        loading = false;
      });
    }

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
            child: loading ? (Center(child: CircularProgressIndicator(),)) : (
                SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (textValue) {
                          inputOnChange("productName", textValue);
                        },
                        decoration: AppInputDecoration("Product Name"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (textValue) {
                          inputOnChange("price", textValue);
                        },
                        decoration: AppInputDecoration("Product Price"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (textValue) {
                          inputOnChange("img", textValue);
                        },
                        decoration: AppInputDecoration("Product Image"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // TextFormField(
                      //   keyboardType: TextInputType.number,
                      //   onChanged: (textValue) {
                      //     inputOnChange("UnitPrice", textValue);
                      //   },
                      //   decoration: AppInputDecoration("Unit Price"),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextFormField(
                      //   keyboardType: TextInputType.number,
                      //   onChanged: (textValue) {
                      //     inputOnChange("TotalPrice", textValue);
                      //   },
                      //   decoration: AppInputDecoration("Total Price"),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // AppDropDown(
                      //   DropdownButton(
                      //     value: formValues['Qty'],
                      //     items: [
                      //       DropdownMenuItem(
                      //         value: '',
                      //         child: Text('Select Qty'),
                      //       ),
                      //       DropdownMenuItem(
                      //         value: '1',
                      //         child: Text('1'),
                      //       ),
                      //       DropdownMenuItem(
                      //         value: '2',
                      //         child: Text('2'),
                      //       ),
                      //       DropdownMenuItem(
                      //         value: '3',
                      //         child: Text('3'),
                      //       ),
                      //     ],
                      //     onChanged: (textValue) {
                      //       inputOnChange("Qty", textValue);
                      //     },
                      //     isExpanded: true,
                      //     underline: Container(),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      ElevatedButton(
                        style: AppButtonStyle(),
                        onPressed: () {formOnSubmit();},
                        child: SuccessButton('Submit'),
                      ),
                    ],
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
