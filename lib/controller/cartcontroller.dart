import 'package:fakestoreapiintegration/model/cartmodel.dart';
import 'package:fakestoreapiintegration/model/storemodel.dart';
import 'package:fakestoreapiintegration/view/cartscreen/cartscreen.dart';
import 'package:flutter/material.dart';

class CartScreenController with ChangeNotifier {
  List<CartModel> cartList = [];
  double totalPrice = 0;
  addToCart(ProductResmodel product, BuildContext context) {
    final isCarted =
        cartList.any((element) => element.product.id == product.id);

    if (isCarted) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ));
      print("already in cart");
    } else {
      cartList.add(CartModel(product: product));
    }

    notifyListeners();
  }

  deleteFromCart(int index) {
    cartList.removeAt(index);
    calculateTotal();
    notifyListeners();
  }

  onIncrimentqty(int index) {
    cartList[index].qty = cartList[index].qty + 1;
    calculateTotal();
    notifyListeners();
  }

  onDecrimentqty(int index) {
    if (cartList[index].qty > 1) {
      cartList[index].qty = cartList[index].qty - 1;
    }
    calculateTotal();
    notifyListeners();
  }

  calculateTotal() {
    totalPrice = 0;
    for (var element in cartList) {
      totalPrice = totalPrice + (element.qty * (element.product.price ?? 0));
    }
    print("total : $totalPrice");
    notifyListeners();
  }
}
