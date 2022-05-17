import 'package:flutter/material.dart';
import 'package:practise_flutter/models/cart.dart';
import 'package:practise_flutter/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp((ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MyApp(),
    )));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
