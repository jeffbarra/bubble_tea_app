import 'package:boba_tea_app/components/drink_tile.dart';
import 'package:boba_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Remove from cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading
              Center(
                child: const Text(
                  'Your Drink Order',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              // List of Cart Items
              Expanded(
                child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      // Get individual drink in cart first
                      Drink drink = value.cart[index];

                      // return as a tile
                      return DrinkTile(
                        drink: drink,
                        onTap: () => removeFromCart(drink),
                        trailing: Icon(Icons.delete),
                      );
                    }),
              ),

              // Pay Button
              MaterialButton(
                  child: Text('Pay Now',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.brown,
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
