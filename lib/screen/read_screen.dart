import 'package:flutter/material.dart';
import 'package:flutter_crud/rest_api/rest_client.dart';
import 'package:flutter_crud/screen/create_screen_new.dart';

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
              itemCount: productList.length,
              itemBuilder: (context, index) {
                // Your item builder code here
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: Image.network(productList[index]['img'],fit: BoxFit.fill,),),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(productList[index]['productName']),
                            Text(productList[index]['price']),
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.edit),color: Colors.green,),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Delete Confirmation'),
                                          content: Text('Are you sure you want to delete this item?'),
                                          actions: [
                                            TextButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop(); // Close the dialog
                                              },
                                            ),
                                            TextButton(
                                              child: Text('Delete'),
                                              onPressed: () {
                                                // Perform delete operation here
                                                Navigator.of(context).pop(); // Close the dialog
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                ),

                              ],
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateScreenNew()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigoAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
  }
}
