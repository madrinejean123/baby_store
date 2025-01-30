import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 192, 203),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(173, 173, 216, 230),
          title: Text('Cart')),
    );
  }
}
