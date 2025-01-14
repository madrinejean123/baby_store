import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/screens/Orders.png"),
            Image.asset("assets/screens/Cancel order - Select a reason.png"),
          ],
        ),
      ),
    );
  }
}
