import 'package:flutter/material.dart';
import 'package:loja_nove/screens/home_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:loja_nove/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
    theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141)),
  ));
}
