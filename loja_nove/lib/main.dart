import 'package:flutter/material.dart';
import 'package:loja_nove/models/cart_model.dart';
import 'package:loja_nove/models/user_model.dart';
import 'package:loja_nove/screens/home_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        return ScopedModel<CartModel>(
          model: CartModel(model),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: Color.fromARGB(255, 4, 125, 141)),
          ),
        );
      }),
    ),
  );
}
