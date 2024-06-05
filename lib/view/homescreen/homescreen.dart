import 'package:fakestoreapiintegration/controller/cartcontroller.dart';
import 'package:fakestoreapiintegration/controller/homescreencontroller.dart';
import 'package:fakestoreapiintegration/view/cartscreen/cartscreen.dart';
import 'package:fakestoreapiintegration/view/globalwidget/loadinginticator.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<HomeScreenController>().getproducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Provider = context.watch<HomeScreenController>();
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.star)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
              icon: Icon(Icons.add_shopping_cart)),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: UserAccountsDrawerHeader(
                    currentAccountPictureSize: Size(50, 50),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/19467713/pexels-photo-19467713/free-photo-of-portrait-of-woman-in-coat-and-scarf.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                    ),
                    accountName: Text("name"),
                    accountEmail: Text("mailid"))),
            ListTile(leading: Icon(Icons.settings), title: Text("settings"))
          ],
        ),
      ),
      body: Provider.isloading
          ? Center(
              child: Loadinginticator(),
            )
          : ListView.builder(
              itemCount: Provider.ProductList.length,
              itemBuilder: (context, index) => Container(
                child: ListTile(
                  leading:
                      Image.network(Provider.ProductList[index].image ?? ""),
                  title: Text(Provider.ProductList[index].title.toString()),
                  trailing: InkWell(
                      onTap: () {
                        context
                            .read<CartScreenController>()
                            .addToCart(Provider.ProductList[index], context);
                      },
                      child: Icon(Icons.add_shopping_cart)),
                ),
              ),
            ),
    );
  }
}
