import 'dart:convert';
import 'dart:developer';

import 'package:fakestoreapiintegration/model/storemodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List<ProductResmodel> ProductList = [];
  bool isloading = false;
  Future getproducts() async {
    isloading = true;
    notifyListeners();

    final url = Uri.parse("https://fakestoreapi.com/products");

    final res = await http.get(url);

    if (res.statusCode == 200) {
      final decodedata = jsonDecode(res.body) as List;
      print(decodedata);
      ProductList = decodedata
          .map((Element) => ProductResmodel.fromJson(Element))
          .toList();
      log(ProductList.first.title.toString());
    } else {
      print("error");
    }
    isloading = false;
    notifyListeners();
  }
}
