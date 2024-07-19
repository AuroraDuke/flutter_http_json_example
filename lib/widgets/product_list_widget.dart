import 'package:flutter/material.dart';
import 'package:flutter_application_http/models/product.dart';
import 'package:flutter_application_http/widgets/product_list_row.dart';

// ignore: must_be_immutable
class ProductListWidget extends StatefulWidget {
  List<Product> products = [];

  ProductListWidget(List<Product> products) {
    this.products = products;
  }

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    // return ListView.builder(itemCount:widget.products.length ,itemBuilder:(context,index){ return Text(widget.products[index].productName)});
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height:7.8 * (MediaQuery.of(context).size.height) / 10 ,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (index) {
              return ProductListRowWidget(widget.products[index]);
            }),
          ),
        )
      ],
    );
  }
}//Text(widget.products[index].productName)