import 'package:flutter_application_1/core/myStore.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;
  //stored the id of the add to cart items
  final List<int> _itemIds = [];

// get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    int id = (item.id).toInt();
    (VxState.store as MyStore).cart._itemIds.add(id);
  }
}

class RemoveMutation extends VxMutation {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    (VxState.store as MyStore).cart._itemIds.remove(item.id);
  }
}
