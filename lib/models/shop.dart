import 'package:flutter/material.dart';

import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier {
  // List of drinks for sale
  final List<Drink> _shop = [
    // Pearl milk tea
    Drink(
      name: "Pearl Milk Tea",
      price: "\$3.00",
      imagePath: "lib/images/bubble-tea.png",
    ),

    Drink(
      name: "Chocolate Milk Tea",
      price: "\$3.50",
      imagePath: "lib/images/bubble-choco.png",
    ),
    Drink(
      name: "Fruity Milk Tea",
      price: "\$4.00",
      imagePath: "lib/images/bubble-fruity.png",
    ),
    Drink(
      name: "Blended Milk Tea",
      price: "\$4.50",
      imagePath: "lib/images/bubble-blend.png",
    ),
    Drink(
      name: "Coffee Milk Tea",
      price: "\$5.00",
      imagePath: "lib/images/coffee.png",
    ),
    Drink(
      name: "Pink Milk Tea",
      price: "\$5.00",
      imagePath: "lib/images/bubble-pink.png",
    ),
  ];

  // List of drinks in your cart
  final List<Drink> _userCart = [];

  // Get drinks for sale
  List<Drink> get shop => _shop;

  // Get user cart
  List<Drink> get cart => _userCart;

  // Add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // Remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
