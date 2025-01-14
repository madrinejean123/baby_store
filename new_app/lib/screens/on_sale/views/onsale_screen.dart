import 'dart:convert'; // Import for JSON handling
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnsaleScreen extends StatelessWidget {
  const OnsaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Bedroom Essentials'),
      ),
      body: BabyBedroomItems(),
    );
  }
}

class BabyBedroomItems extends StatefulWidget {
  const BabyBedroomItems({super.key});

  @override
  _BabyBedroomItemsState createState() => _BabyBedroomItemsState();
}

class _BabyBedroomItemsState extends State<BabyBedroomItems> {
  List<BabyItem> items = [
    BabyItem(
        name: 'Baby Crib',
        price: 150.00,
        image: 'assets/crib.png',
        description: 'Comfortable baby crib for your newborn.'),
    BabyItem(
        name: 'Changing Table',
        price: 80.00,
        image: 'assets/changing_table.png',
        description: 'A safe changing table for babies.'),
    BabyItem(
        name: 'Baby Mattress',
        price: 120.00,
        image: 'assets/mattress.png',
        description: 'High-quality mattress for your baby\'s crib.'),
    BabyItem(
        name: 'Baby Monitor',
        price: 60.00,
        image: 'assets/monitor.png',
        description: 'Monitor your baby from any room with ease.'),
    BabyItem(
        name: 'Rocking Chair',
        price: 100.00,
        image: 'assets/rocking_chair.png',
        description: 'A comfortable chair for you to rock your baby.'),
    BabyItem(
        name: 'Night Light',
        price: 20.00,
        image: 'assets/night_light.png',
        description: 'Gentle night light for your baby\'s room.'),
  ];

  List<BabyItem> cart = [];

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  void addToCart(BabyItem item) {
    setState(() {
      cart.add(item);
    });
    _saveCart();
  }

  void _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartJson = prefs.getString('cart');
    if (cartJson != null) {
      List<dynamic> cartData = jsonDecode(cartJson);
      setState(() {
        cart = cartData
            .map((item) => BabyItem.fromJson(jsonEncode(item)))
            .toList();
      });
    }
  }

  void _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartJsonList = cart.map((item) => item.toJson()).toList();
    prefs.setString('cart', jsonEncode(cartJsonList));
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in cart) {
      total += item.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index].name),
                subtitle: Text('\$${items[index].price.toStringAsFixed(2)}'),
                leading: Image.asset(items[index].image, width: 50, height: 50),
                trailing: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () => addToCart(items[index]),
                ),
              );
            },
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Cart',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ...cart.map((item) {
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                );
              }),
              Divider(),
              Text(
                'Total: \$${getTotalPrice().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (cart.isNotEmpty) {
                    // Simulate a checkout action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Checkout completed!')),
                    );
                    setState(() {
                      cart.clear(); // Clear cart after checkout
                    });
                    _saveCart(); // Save the empty cart state
                  }
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BabyItem {
  final String name;
  final double price;
  final String image;
  final String description;

  BabyItem({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  // Convert BabyItem to JSON
  String toJson() {
    return jsonEncode({
      'name': name,
      'price': price,
      'image': image,
      'description': description,
    });
  }

  // Convert JSON to BabyItem
  factory BabyItem.fromJson(String jsonString) {
    final Map<String, dynamic> data = jsonDecode(jsonString);
    return BabyItem(
      name: data['name'],
      price: data['price'],
      image: data['image'],
      description: data['description'],
    );
  }
}
