import 'package:flutter/material.dart';

// Define a simple data model for baby furniture
class BabyFurnitureItem {
  final String name;
  final String image;
  final double price;

  BabyFurnitureItem({
    required this.name,
    required this.image,
    required this.price,
  });
}

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of baby furniture items
    List<BabyFurnitureItem> furnitureItems = [
      BabyFurnitureItem(
        name: "Baby Crib",
        image: "assets/baby_crib.png",
        price: 120.99,
      ),
      BabyFurnitureItem(
        name: "Changing Table",
        image: "assets/changing_table.png",
        price: 75.49,
      ),
      BabyFurnitureItem(
        name: "Rocking Chair",
        image: "assets/rocking_chair.png",
        price: 89.99,
      ),
      BabyFurnitureItem(
        name: "Baby Dresser",
        image: "assets/baby_dresser.png",
        price: 150.00,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Baby Furniture"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Open cart (implement cart functionality here)
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: furnitureItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              leading: Image.asset(
                furnitureItems[index].image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(furnitureItems[index].name),
              subtitle:
                  Text("\$${furnitureItems[index].price.toStringAsFixed(2)}"),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  // Add item to cart (implement cart functionality here)
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
