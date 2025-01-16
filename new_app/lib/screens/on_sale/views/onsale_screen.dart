import 'package:flutter/material.dart';

class OnSaleScreen extends StatefulWidget {
  const OnSaleScreen({super.key});

  @override
  _OnSaleScreenState createState() => _OnSaleScreenState();
}

class _OnSaleScreenState extends State<OnSaleScreen> {
  int cartCount = 0;
  String searchQuery = '';

  static List<Map<String, dynamic>> onSaleItems = [
    {
      'name': 'Baby Blanket',
      'price': 50000,
      'discount': 10,
      'image':
          'https://i.pinimg.com/236x/42/8e/a2/428ea263383400216cb3bf7fdb6e08e9.jpg'
    },
    {
      'name': 'Baby Wardrobe',
      'price': 80000,
      'discount': 15,
      'image':
          'https://i.pinimg.com/236x/2d/8c/13/2d8c13e157390378118d1849f49b5d8f.jpg'
    },
    {
      'name': 'Baby Bed',
      'price': 150000,
      'discount': 20,
      'image':
          'https://i.pinimg.com/236x/43/33/26/433326a4c808e947d7bd3e8c91aa93ca.jpg'
    },
    {
      'name': 'Baby Carrier',
      'price': 60000,
      'discount': 5,
      'image':
          'https://i.pinimg.com/236x/3a/08/db/3a08dbf37a54d9b59589bc853e8fbe2f.jpg'
    },
    {
      'name': 'Night Light',
      'price': 30000,
      'discount': 10,
      'image':
          'https://i.pinimg.com/236x/a5/5b/89/a55b8938e959ba03e7be1697094c0738.jpg'
    },
    {
      'name': 'Baby Cosmetics',
      'price': 45000,
      'discount': 12,
      'image':
          'https://i.pinimg.com/736x/1e/a4/f6/1ea4f6173518574c5d57ee6e6bcac57e.jpg'
    },
    {
      'name': 'Feeding Chair',
      'price': 70000,
      'discount': 18,
      'image':
          'https://i.pinimg.com/736x/36/54/7a/36547a9e2fa3c837d85f90c287d88043.jpg'
    },
    {
      'name': 'Baby Mat',
      'price': 40000,
      'discount': 5,
      'image':
          'https://i.pinimg.com/236x/4e/3f/ef/4e3fef87c0ee8d89e43c2d0cdd96cf6f.jpg'
    },
    {
      'name': 'Baby Overalls',
      'price': 55000,
      'discount': 10,
      'image':
          'https://i.pinimg.com/736x/ec/3e/4c/ec3e4c375c7f9ca9083ce98ca673c91a.jpg'
    },
    {
      'name': 'Baby Pants',
      'price': 30000,
      'discount': 15,
      'image':
          'https://i.pinimg.com/236x/39/e5/bc/39e5bca90758831e76d1d22f6474adf0.jpg'
    },
    {
      'name': 'Baby Shirts',
      'price': 35000,
      'discount': 10,
      'image':
          'https://i.pinimg.com/236x/ed/3c/fa/ed3cfa19b567404073b9c1115fbedbbb.jpg'
    },
    {
      'name': 'Baby Dresses',
      'price': 70000,
      'discount': 20,
      'image':
          'https://i.pinimg.com/736x/44/38/54/4438548726f756aafcbcc01cf9ff365e.jpg'
    },
  ];

  List<Map<String, dynamic>> getFilteredItems() {
    return onSaleItems
        .where((item) =>
            item['name'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  void addToCart() {
    setState(() {
      cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Sale – Baby Deals You’ll Love!'),
        backgroundColor: Colors.tealAccent.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Navigator.pop(context),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              if (cartCount > 0)
                Positioned(
                  right: 0,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search Products',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemCount: getFilteredItems().length,
                itemBuilder: (context, index) {
                  final item = getFilteredItems()[index];
                  final discountedPrice =
                      item['price'] * (1 - item['discount'] / 100);
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child:
                                Image.network(item['image'], fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text('UGX ${discountedPrice.toStringAsFixed(0)}',
                                  style: const TextStyle(color: Colors.teal)),
                              Text('Was: UGX ${item['price']}',
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough)),
                              const SizedBox(height: 5),
                              ElevatedButton(
                                onPressed: addToCart,
                                child: const Text('Add to Cart'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.tealAccent),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: OnSaleScreen()));
