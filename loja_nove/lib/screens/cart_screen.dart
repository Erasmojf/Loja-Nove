import 'package:flutter/material.dart';
import 'package:loja_nove/models/cart_model.dart';
import 'package:loja_nove/models/user_model.dart';
import 'package:loja_nove/screens/login_screen.dart';
import 'package:loja_nove/tiles/cart_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color primeryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu carinho'),
        actions: [
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(
                builder: (context, child, model) {
              int p = model.products.length;
              return Text(
                '${p ?? 0} ${p == 1 ? 'ITEM' : 'ITENS'}',
                style: TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              );
            }),
          ),
        ],
      ),
      body: ScopedModelDescendant<CartModel>(builder: (context, child, model) {
        if (model.isLoading && UserModel.of(context).isLoggedIn()) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!UserModel.of(context).isLoggedIn()) {
          return Container(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove_shopping_cart,
                  size: 80.0,
                  color: primeryColor,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Faça login para adicionar produto',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                RaisedButton(
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: primeryColor,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    }),
              ],
            ),
          );
        } else {
          if (model.products == null || model.products.length == 0) {
            return Center(
              child: Text(
                'Nenhum produto no carinho!',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView(
              children: model.products.map((product) {
                return CartTile(product);
              }).toList(),
            );
          }
        }
      }),
    );
  }
}
