import 'package:flutter/material.dart';
import 'package:flutter_application_http/models/product.dart';

// ignore: must_be_immutable
class ProductListRowWidget extends StatelessWidget{
  Product product;

  ProductListRowWidget(this.product);


  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }
  
  Widget buildProductItemCard(BuildContext context) {

    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              child:Image.network("https://upload.wikimedia.org/wikipedia/commons/a/a5/Red_Kitten_01.jpg"),
              height: 120.0,
              width: MediaQuery.of(context).size.width/2,
            ),
            Text(product.productName),
            Text(product.unitPrice.toString()+"#",style: TextStyle(fontSize: 16.0,color: Colors.pinkAccent),)
          ],
        ),
      ),
    );

  }

}