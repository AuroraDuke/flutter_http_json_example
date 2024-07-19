import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_http/data/data.api/category_api.dart';
import 'package:flutter_application_http/data/data.api/product_api.dart';
import 'package:flutter_application_http/models/category.dart';
import 'package:flutter_application_http/models/product.dart';
import 'package:flutter_application_http/widgets/product_list_widget.dart';

class MainScreens extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreensState();
  }
}

class MainScreensState extends State<MainScreens> {
  List<Category> categories = [];
  List<Widget> categoryWidgets = [];
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getProducts();
    getCategoriesFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Application System",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(products),
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      if (response.statusCode == 200) {
        setState(() {
          Iterable list = json.decode(response.body);
          categories = list.map((model) => Category.fromJson(model)).toList();
          getCategoryWidgets();
        });
      } else {
        // Handle error case
        print('Failed to load categories: ${response.statusCode}');
        // Optionally, print response body for more details
        print('Response body: ${response.body}');
      }
    }).catchError((error) {
      // Handle error case
      print('Error: $error');
    });
  }

  List<Widget> getCategoryWidgets() {
    categoryWidgets.clear(); // Clear existing widgets
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return ElevatedButton(
      onPressed: () {
        // Add your onPressed logic here
        print('Category ${category.categoryName} pressed');
        getProductsByCategoryId(category);
      },
      child: Text(
        category.categoryName,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.blueAccent), // Border color
        ),
      ),
    );
  }

 void getProductsByCategoryId(Category category) {
  ProductApi.getProductsByCategoryId(category.id).then((response) {
    if (response.statusCode == 200) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    } else {
      // Handle error case
      print('Failed to load products: ${response.statusCode}');
      // Optionally, print response body for more details
      print('Response body: ${response.body}');
    }
  }).catchError((error) {
    // Handle error case
    print('Error: $error');
  });
}


void getProducts() {
  ProductApi.getProduct().then((response) {
    if (response.statusCode == 200) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    } else {
      // Handle error case
      print('Failed to load products: ${response.statusCode}');
      // Optionally, print response body for more details
      print('Response body: ${response.body}');
    }
  }).catchError((error) {
    // Handle error case
    print('Error: $error');
  });
}
}
