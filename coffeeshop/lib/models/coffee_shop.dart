import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  //Coffee for sale list
  final List<Coffee> _shop = [
    //kafe e zeze
    Coffee(
        name: 'Long Black',
        price: '4.10 ALL',
        imagePath: 'lib/images/coffee.png'),
    //kafe latte
    Coffee(name: 'Latte', price: '4.20 ALL', imagePath: 'lib/images/latte.png'),
    //kafe ekspres
    Coffee(
        name: 'Esspresso',
        price: '3.50 ALL',
        imagePath: 'lib/images/espresso.png'),
    //kafe e iced
    Coffee(
        name: 'Iced Coffee',
        price: '4.40 ALL',
        imagePath: 'lib/images/ice.png'),
  ];

  //user cart
  List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get coffeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee) {
    userCart.remove(coffee);
    notifyListeners();
  }
}
