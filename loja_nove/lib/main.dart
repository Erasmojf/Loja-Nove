import 'package:flutter/material.dart';
import 'package:loja_nove/screens/home_screen.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Color.fromARGB(255, 4, 125, 141)
    ),
  ));
}

