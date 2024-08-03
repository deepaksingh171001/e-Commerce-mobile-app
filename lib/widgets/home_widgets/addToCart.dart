import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/myStore.dart';
import 'package:flutter_application_1/models/cartModel.dart';
import 'package:flutter_application_1/models/catalog.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;

  AddtoCart({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            AddMutation(catalog);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: context.cardColor,
              content: "Already in Cart"
                  .text
                  .center
                  .textStyle(const TextStyle(fontStyle: FontStyle.normal))
                  .color(Colors.red)
                  .make(),
              duration: const Duration(milliseconds: 1000),
            ));
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart
            ? const Icon(Icons.done)
            : "Add to cart".text.make().pLTRB(0, 5, 0, 5));
  }
}
