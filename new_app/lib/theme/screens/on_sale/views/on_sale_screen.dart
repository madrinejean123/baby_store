import 'package:flutter/material.dart';

class BedroomEssentialsScreen extends StatelessWidget {
  const BedroomEssentialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bedroom Essentials'), // Changed title here
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
    BabyItem(name: 'Baby Crib', price: 150.00),
    BabyItem(name: 'Changing Table', price: 80.00),
    BabyItem(name: 'Baby Mattress', price: 120.00),
    BabyItem(name: 'Baby Monitor', price: 60.00),
    BabyItem(name: 'Rocking Chair', price: 100.00),
    BabyItem(name: 'Night Light', price: 20.00),
  ];

  List<BabyItem> cart = [];

  void addToCart(BabyItem item) {
    setState(() {
      cart.add(item);
    });
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

  BabyItem({required this.name, required this.price});
}
