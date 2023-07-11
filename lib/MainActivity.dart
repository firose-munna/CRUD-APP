import 'package:crud/create_product_screen.dart';
import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD APP"),
        centerTitle: true,
        elevation: 6,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProductScreen()));
        },
        child: Icon(Icons.add),
      ),

      body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index){
            return ListTile(
              onLongPress: (){
                myAlertMessage("Choose An Action", context);
              },
              leading: Image.network("hjhjdj", width: 50, errorBuilder: (_,__,___){
                return Icon(Icons.image, size: 32,);
              }),

              title: Text("Product Name"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Code"),
                  Text("Total Price"),
                  Text("Available Units"),
                ],
              ),
              trailing: Text("Unit Price"),

            );
          },
      separatorBuilder: (context, index){
            return Divider(height: 0,);
      },),
    );
  }
}
