import 'package:flutter/material.dart';
import 'package:loja_nove/ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Color.fromARGB(255, 4, 125, 141)
    ),
  ));
}

