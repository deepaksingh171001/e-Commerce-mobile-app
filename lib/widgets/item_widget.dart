import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //function to convert hexcolor into int value

    // final _color = (String hexColor) {
    //   hexColor = hexColor.replaceAll("#", "");
    //   if (hexColor.length == 6) {
    //     hexColor = "FF" + hexColor;
    //   }
    //   if (hexColor.length == 8) {
    //     return Color(int.parse("0x$hexColor"));
    //   }
    // }(item.color);
    // print(_color);
    return Card(
        child: ListTile(
      leading: Image.network(item.image),
      title: Text(item.name),
      subtitle: Text(item.desc),
      trailing: Text("\$${item.price}"),
    ));
  }
}
