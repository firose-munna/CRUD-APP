import 'package:flutter/material.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
        elevation: 6,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Product Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Product Code",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Image",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Unit Price",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Quantity",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Total Price",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
              SizedBox(height: 16,),

              SizedBox(
                width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: Text("Add Product")))
            ],
          ),
        ),
      ),
    );
  }
}
