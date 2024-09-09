import 'package:flutter/material.dart';
import 'package:flutter_crud/rest_api/rest_client.dart';

import '../style/style.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  List productList = [];
  bool isLoading = false;

  @override
  void initState() {
    callData();
    super.initState();
  }

  callData() async {
    isLoading = true;
    var data = await productReadRequest();
    setState(() {
      productList = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: isLoading
                ? (Center(
              child: CircularProgressIndicator(),
            ))
                : GridView.builder(
              gridDelegate: ProductGridViewStyle(),
              itemBuilder: (context, index) {
                // Your item builder code here
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: Image.network(productList[index]['img'],fit: BoxFit.fill,),),

                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
