import 'package:boba_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customize sweetness
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  // Add to Cart
  void addToCart() {
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    // Direct user back to the shop page
    Navigator.pop(context);

    // Let user know it has been added to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
            child: Text('Added drink to cart!',
                style: TextStyle(color: Colors.brown))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.brown[200],
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            // drink image
            Image.asset(
              widget.drink.imagePath,
              height: 200,
              width: 200,
            ),

            // sliders to customize drink
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  // Sweetness Slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100, child: Text('Sweet')),
                      Expanded(
                        child: Slider(
                          value: sweetValue,
                          divisions: 4,
                          onChanged: (value) => customizeSweet(value),
                          activeColor: Colors.brown,
                          inactiveColor: Colors.brown[300],
                        ),
                      ),
                    ],
                  ),

                  // Ice Slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100, child: Text('Ice')),
                      Expanded(
                        child: Slider(
                          value: iceValue,
                          divisions: 4,
                          onChanged: (value) => customizeIce(value),
                          activeColor: Colors.brown,
                          inactiveColor: Colors.brown[300],
                        ),
                      ),
                    ],
                  ),

                  // Pearl Slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100, child: Text('Pearls')),
                      Expanded(
                        child: Slider(
                          value: pearlValue,
                          divisions: 4,
                          onChanged: (value) => customizePearl(value),
                          activeColor: Colors.brown,
                          inactiveColor: Colors.brown[300],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Add to Cart Button
            MaterialButton(
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.brown,
              onPressed: addToCart,
            ),
          ],
        ),
      ),
    );
  }
}
