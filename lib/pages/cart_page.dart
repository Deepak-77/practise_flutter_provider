import 'package:flutter/material.dart';
import 'package:practise_flutter/pages/checkout.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
            bottomNavigationBar: Container(
              height: 40,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text("Total",style: TextStyle(color: Colors.white)),
                          Text(
                            ' Rs. ' + cart.total.toString(),
                            textScaleFactor: 1.5,style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    RaisedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>CheckOut()));
                      },
                      child: Text('Check Out'),
                    ),

                  ],
                ),
              ),
            ),
            appBar: AppBar(
              title: Text('Cart'),
            ),
            body: cart.count == 0
                ? Center(
                    child: Text('No any item in cart!'),
                  )
                : ListView.builder(
                    itemCount: cart.count,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(cart.basketItems[index].title),
                          subtitle:
                              Text(cart.basketItems[index].price.toString()),
                          trailing: Icon(Icons.delete),
                          onTap: () {
                            cart.remove(cart.basketItems[index]);
                          },
                        ),
                      );
                    }));
      },
    );
  }
}
