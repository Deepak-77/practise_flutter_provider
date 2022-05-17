import 'package:flutter/material.dart';
import 'package:practise_flutter/pages/cart_page.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> products = [
    Product(title: 'Apple', price: 30),
    Product(title: 'Mango', price: 10),
    Product(title: 'Banana', price: 5),
    Product(title: 'Oranges', price: 10),
    Product(title: 'Potato', price: 50),
    Product(title: 'Tomato', price: 60),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Shopping'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                ],
              ),
            ),
            Text(cart.count.toString()),
          ],
        ),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(products[index].title),
                subtitle: Text(products[index].price.toString()),
                trailing: Icon(Icons.add),
                onTap: () {
                  cart.add(products[index]);
                },
              );
            }),
      );
    });
  }
}
