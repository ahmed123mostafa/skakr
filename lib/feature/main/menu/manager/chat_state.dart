

import 'package:settings_app/feature/main/menu/model/cart_item_model.dart' show CartItem;

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartAddItemSuccess extends CartState {


}


  class GetCartItemSuccess extends CartState {
  List<CartItem>items;
    GetCartItemSuccess({required this.items});

  }
  class CartRemoveItemSuccess extends CartState {


  }

class CartFailure extends CartState {
  CartFailure(this.error);
  final String error;
}