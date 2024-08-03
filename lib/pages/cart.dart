import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/myStore.dart';
import 'package:flutter_application_1/models/cartModel.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _CartTotal(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.accentColor),
        title: "Cart".text.color(context.accentColor).make(),
      ),
      body: Column(
        children: [
          _CartList().expand(),
          Divider(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel _Cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return SizedBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "\$${_Cart.totalPrice}".text.xl.color(Colors.red).make(),
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: context.cardColor,
                content: "Sorry! Buying is not supported yet"
                    .text
                    .center
                    .color(context.accentColor)
                    .make(),
                duration: const Duration(milliseconds: 1000),
              ));
            },
            child: "BUY".text.make(),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor))),
      ],
    )).px(20);
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? const Icon(Icons.remove_shopping_cart).iconSize(56).centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              tileColor: context.cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              leading: (Image.network(
                _cart.items[index].image,
              )).p(2),
              subtitle: "\$${_cart.items[index].price}"
                  .text
                  .color(Colors.red)
                  .textStyle(const TextStyle(fontStyle: FontStyle.normal))
                  .make(),
              trailing: IconButton(
                icon: Icon(
                  CupertinoIcons.cart_fill_badge_minus,
                  color: context.accentColor,
                ),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                  setState(() {});
                },
              ),
              title: _cart.items[index].name.text.xl.make(),
            ).p12(),
          );
  }
}
