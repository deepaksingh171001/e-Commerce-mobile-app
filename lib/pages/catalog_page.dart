import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/addToCart.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color checkTheme = (context.theme.canvasColor);
    return Scaffold(
      backgroundColor: Vx.white,
      appBar: AppBar(
        backgroundColor: Vx.white,
      ),
      bottomNavigationBar: ButtonBar(
        buttonPadding: Vx.m16,
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}".text.xl2.color(Colors.red).make(),
          AddtoCart(catalog: catalog)
        ],
      ).pOnly(bottom: 12).backgroundColor(
          (checkTheme == Colors.black ? context.cardColor : Vx.yellow300)),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 50.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: (checkTheme == Colors.black
                    ? context.cardColor
                    : Vx.yellow300),
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.bold
                        .color(context.theme.accentColor)
                        .xl4
                        .make(),
                    catalog.desc.text.xl
                        .textStyle(TextStyle(fontStyle: FontStyle.normal))
                        .make(),
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
                        .text
                        .make()
                        .px32()
                        .py12()
                  ],
                ).pLTRB(12, 64, 12, 0),
              ),
            ))
          ],
        ).centered(),
      ),
    );
  }
}
