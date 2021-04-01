import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_nove/datas/cart_product.dart';
import 'package:loja_nove/datas/product_data.dart';
import 'package:loja_nove/models/cart_model.dart';

class CartTile extends StatelessWidget {
  final CartProduct cartProduct;

  CartTile(this.cartProduct) {
    print(
        "Categoria: ${cartProduct.category}  | ID do produto: ${cartProduct.pid}");
  }
  @override
  Widget build(BuildContext context) {
    final Color primeryColor = Theme.of(context).primaryColor;
    Widget _buildContent() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 120.0,
            child: Image.network(
              cartProduct.productData.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartProduct.productData.title,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Tamanho ${cartProduct.size}',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey[300]),
                  ),
                  Text(
                    'R\$ ${cartProduct.productData.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: primeryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: primeryColor,
                        ),
                        onPressed: cartProduct.quantity > 1
                            ? () {
                                CartModel.of(context).decProduct(cartProduct);
                              }
                            : null,
                      ),
                      Text(cartProduct.quantity.toString()),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: primeryColor,
                        ),
                        onPressed: () {
                          CartModel.of(context).inProduct(cartProduct);
                        },
                      ),
                      FlatButton(
                        onPressed: () {
                          CartModel.of(context).removeCartItem(cartProduct);
                        },
                        child: Text('Remover'),
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: cartProduct?.productData == null
          ? FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('products')
                  .doc(cartProduct.category)
                  .collection('items')
                  .doc(cartProduct.pid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  cartProduct.productData =
                      ProductData.fromDocument(snapshot.data);
                  return _buildContent();
                } else {
                  return Container(
                    height: 70.0,
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  );
                }
              })
          : _buildContent(),
    );
  }
}
