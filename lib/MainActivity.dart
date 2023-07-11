import 'dart:convert';

import 'package:crud/Product.dart';
import 'package:crud/create_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {

  List<Product> product = [];

  bool inProgress = false;

  myAlertMessage(messageTitle,context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                titlePadding: EdgeInsets.only(left: 16),
                contentPadding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                title: Row(
                  children: [
                    Text(messageTitle),
                    Spacer(),
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close))
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.edit),
                      title: Text("Edit"),
                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.delete),
                      title: Text("Delete"),
                    )
                  ],
                )
                
              )
          );
        }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  void getProduct() async {
    //https://crud.teamrabbil.com/api/v1/ReadProduct
    //call - get
    inProgress = true;
    setState(() {});
    
    Response response = await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));

    // print(response.statusCode);
     print(response.body);

    final  Map<String, dynamic> decodeRespons = jsonDecode(response.body);


    if(response.statusCode == 200 && decodeRespons['status'] == 'success'){
      product.clear();
      decodeRespons['data'].forEach((e){
        
        product.add(Product.toJson(e));

      });
    }
    inProgress = false;
    setState(() {});


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(


        title: Text("CRUD APP"),
        centerTitle: false,
        elevation: 6,
        actions: [
          IconButton(onPressed: (){
            getProduct();
            setState(() {

          });}, icon: Icon(Icons.refresh))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProductScreen()));
        },
        child: Icon(Icons.add),
      ),

      body: inProgress ? const Center(child: CircularProgressIndicator(),): ListView.separated(
          itemCount: product.length,
          itemBuilder: (context, index){
            return ListTile(
              onLongPress: (){
                myAlertMessage("Choose An Action", context);
              },
              leading: Image.network("${product[index].image}", width: 50, errorBuilder: (_,__,___){
                return Icon(Icons.image, size: 32,);
              }),

              title: Text(product[index].productname),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Produc Code: ${product[index].productCode}"),
                  Text("Total Price : ${product[index].totalPrice}"),
                  Text("Available Units : ${product[index].quantity}"),
                ],
              ),
              trailing: Column(
                children: [
                  Text("Unit Price"),
                  Text(product[index].unitPrice),

                ],
              ),

            );
          },
      separatorBuilder: (context, index){
            return Divider(height: 0,);
      },),
    );
  }
}
