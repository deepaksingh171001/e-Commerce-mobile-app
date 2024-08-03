import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cartModel.dart';
import 'package:flutter_application_1/models/catalog.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/widgets/home_widgets/addToCart.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImg(image: catalog.image)),
        10.widthBox,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.make(),
            catalog.desc.text
                .textStyle(const TextStyle(fontStyle: FontStyle.normal))
                .make(),
            ButtonBar(
              buttonPadding: Vx.m12,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.xl.color(Vx.orange500).make(),
                AddtoCart(
                  catalog: catalog,
                )
              ],
            )
          ],
        ))
      ],
    )).color(context.theme.cardColor).rounded.square(150).make().py16();
  }
}

class CatalogImg extends StatelessWidget {
  final String image;
  const CatalogImg({Key? key, required this.image})
      : assert(image.length != 0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p8
        .rounded
        .color(Vx.hexToColor('#F7F7F7'))
        .make()
        .p16();
  }
}
