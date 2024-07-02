import 'package:flutter/material.dart';

import '../../data/models/history_bazar_model.dart';

class TheCart extends ChangeNotifier {
  List cartProducts = [];
  double priceOfProducts = 0;
  addToCart(HistoryBazarModel product) async {
    cartProducts.add(product);
    priceOfProducts += product.price;
    debugPrint('added');
    debugPrint(cartProducts.length.toString());
    notifyListeners();
  }

  deleteFromCart(HistoryBazarModel product) {
    cartProducts.remove(product);
    priceOfProducts -= product.price;
    notifyListeners();
  }

  deleteAllFromCart() {
    cartProducts.clear();
    priceOfProducts -= priceOfProducts;
    notifyListeners();
  }
}
