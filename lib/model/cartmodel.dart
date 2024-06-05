import 'package:fakestoreapiintegration/model/storemodel.dart';

class CartModel {
  ProductResmodel product;
  int qty;
  CartModel({required this.product, this.qty = 1});
}
