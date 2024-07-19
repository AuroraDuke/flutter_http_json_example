import 'package:flutter/material.dart';
import 'package:flutter_application_http/screens/main_screens.dart';

void main() {
  runApp(HttpApp());
}

class HttpApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 
      return MaterialApp(
        home: MainScreens(
          
        ),
      );
  }
}
