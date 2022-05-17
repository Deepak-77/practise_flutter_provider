import 'package:flutter/cupertino.dart';
import 'package:practise_flutter/models/product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _products = [];
  double _total=0;

  void add(Product product) {
    _products.add(product);
    _total += product.price;
    notifyListeners();
  }

  void remove(Product product) {
    _products.remove(product);
    _total -= product.price;
    notifyListeners();
  }

  int get count {
    return _products.length;
  }

  double get total {
    return _total;
  }

  List<Product> get basketItems {
    return _products;
  }
}
