import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/myStore.dart';
import 'package:flutter_application_1/models/cartModel.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

// var mycolor = const Color('FF0000');

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final url = "https://api.jsonbin.io/";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    // final response =
    //     await http.get(Uri.parse("https://fakestoreapi.com/products"));
    // await http.get(Uri(host: url, path: "/b/604dbddb683e7e079c4eefd3"));
    // final catalogJson = response.body;
    var decodedCatalog = jsonDecode(catalogJson);
    var productData = decodedCatalog["products"];

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, _, P) => FloatingActionButton(
          backgroundColor: context.theme.buttonColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cart);
          },
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: context.accentColor,
            size: 20,
            count: _cart.items.length,
            textStyle: TextStyle(
                color: context.canvasColor,
                fontSize: 10,
                fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}
