import 'package:flutter/material.dart';
import 'package:loja_nove/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu carinho'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: ScopedModelDescendant<CartModel>(
                builder: (context, child, model) {
              int p = model.product.length;
              return Text('${p ?? 0} ${p == 1 ? 'ITEM' : 'ITENS'}');
            }),
          )
        ],
      ),
    );
  }
}
