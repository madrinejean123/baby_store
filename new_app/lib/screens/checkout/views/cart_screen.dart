import 'package:flutter/material.dart';
import 'package:shop/constants.dart';
import 'package:shop/screens/kids/views/kids_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItemModel> cartItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as List<CartItemModel>;
    setState(() {
      cartItems = args;
    });
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.item.price * item.quantity;
    }
    return total;
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void updateQuantity(int index, bool increase) {
    setState(() {
      if (increase) {
        cartItems[index].quantity++;
      } else {
        if (cartItems[index].quantity > 1) {
          cartItems[index].quantity--;
        } else {
          removeItem(index);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your cart is empty!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KidsScreen(),
                        ),
                      );
                    },
                    child: const Text('Continue Shopping'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      var product = cartItems[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.all(defaultPadding),
                        leading: Image.asset(product.item.image),
                        title: Text(product.item.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () => updateQuantity(index, false),
                                ),
                                Text('${product.quantity}'),
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () => updateQuantity(index, true),
                                ),
                              ],
                            ),
                            Text(
                              'UGX ${product.item.price * product.quantity}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeItem(index),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter Promo Code',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Total: UGX ${calculateTotal().toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle checkout logic
                        },
                        child: const Text('Proceed to Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class CartItemModel {
  // Renamed from CartItem to CartItemModel
  final Item item;
  int quantity;

  CartItemModel({required this.item, required this.quantity});
}

class Item {
  final String name;
  final String image;
  final double price;

  Item({required this.name, required this.image, required this.price});
}
