import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.brown[700],
        color: Colors.brown[400],
        // tabActiveBorder: Border.all(color: Colors.brown),
        gap: 8,
        iconSize: 32,
        tabs: [
          // Shop Tab
          GButton(
            icon: Icons.local_drink_rounded,
            text: 'Choose',
          ),

          // Cart Tab
          GButton(
            icon: Icons.payment_rounded,
            text: 'Pay',
          ),
        ],
      ),
    );
  }
}
