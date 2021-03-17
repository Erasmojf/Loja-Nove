
import 'package:flutter/material.dart';
import 'package:loja_nove/tabs/home_tab.dart';
import 'package:loja_nove/tabs/products_tab.dart';
import 'package:loja_nove/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            body: HomeTab(),
            drawer: CustomDrawer(_pageController),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text('Produtos'),
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: ProductsTab(),
          ),
          Container(color: Colors.red,),
          Container(color: Colors.amber,),

        ],
      ),
    );
  }
}
