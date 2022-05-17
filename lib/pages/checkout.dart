import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context,cart,child){
      return Scaffold(
appBar: AppBar(
  title: Text('Check Out'),
),
        body: Center(
          child: Text('You have to pay Rs. '+cart.total.toString()),
        ),
      );
    });
  }
}
