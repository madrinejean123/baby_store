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

class KidsScreen extends StatefulWidget {
  const KidsScreen({super.key});

  @override
  _KidsScreenState createState() => _KidsScreenState();
}

class _KidsScreenState extends State<KidsScreen> {
  List<BabyFurnitureItem> furnitureItems = [
    BabyFurnitureItem(
        name: "Baby Crib", image: "assets/baby_crib.png", price: 120990),
    BabyFurnitureItem(
        name: "Changing Table",
        image: "assets/changing_table.png",
        price: 75490),
    BabyFurnitureItem(
        name: "Rocking Chair", image: "assets/rocking_chair.png", price: 89990),
    BabyFurnitureItem(
        name: "Baby Dresser", image: "assets/baby_dresser.png", price: 150000),
    BabyFurnitureItem(
        name: "Baby Stroller",
        image: "assets/baby_stroller.png",
        price: 200000),
    BabyFurnitureItem(
        name: "Baby Walker", image: "assets/baby_walker.png", price: 100000),
    BabyFurnitureItem(
        name: "Baby Swing", image: "assets/baby_swing.png", price: 180000),
    BabyFurnitureItem(
        name: "Baby Mattress", image: "assets/baby_mattress.png", price: 50000),
    BabyFurnitureItem(
        name: "Baby Pillow", image: "assets/baby_pillow.png", price: 30000),
    BabyFurnitureItem(
        name: "Baby Bath Tub", image: "assets/baby_bathtub.png", price: 70000),
    BabyFurnitureItem(
        name: "Baby High Chair",
        image: "assets/baby_high_chair.png",
        price: 110000),
    BabyFurnitureItem(
        name: "Baby Playpen", image: "assets/baby_playpen.png", price: 250000),
    BabyFurnitureItem(
        name: "Baby Blanket", image: "assets/baby_blanket.png", price: 40000),
    BabyFurnitureItem(
        name: "Baby Toy Box", image: "assets/baby_toybox.png", price: 95000),
    BabyFurnitureItem(
        name: "Baby Wardrobe",
        image: "assets/baby_wardrobe.png",
        price: 300000),
  ];

  int cartCount = 0;

  void addToCart() {
    setState(() {
      cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Baby Furniture"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              if (cartCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      '$cartCount',
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: furnitureItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(furnitureItems[index].name),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            furnitureItems[index].image,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: "Leave a comment",
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (rating) {
                              return IconButton(
                                icon: const Icon(Icons.star_border),
                                onPressed: () {},
                              );
                            }),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Close"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        furnitureItems[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(furnitureItems[index].name),
                    ),
                    Text(
                        "UGX ${furnitureItems[index].price.toStringAsFixed(0)}"),
                    ElevatedButton(
                      onPressed: addToCart,
                      child: const Text("Add to Cart"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
