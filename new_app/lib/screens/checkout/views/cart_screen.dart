import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Sample list of cart items (should be replaced with real cart data)
  List<ProductModel> cartItems = [
    ProductModel(
      image: "https://i.pinimg.com/tXyOMMG.png", // Example product image
      title: "Baby Mat",
      brandName: "BabyCo",
      price: 50.00,
      priceAfetDiscount: 45.00,
      dicountpercent: 10,
    ),
    ProductModel(
      image: "https://i.pinimg.com/h2LqppX.png", // Example product image
      title: "Baby Blanket",
      brandName: "SnuggleBaby",
      price: 35.00,
    ),
  ];

  // Calculate total price
  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.priceAfetDiscount ?? item.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Your cart is empty!'))
          : Column(
              children: [
                // Display list of items in the cart
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      var product = cartItems[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.all(defaultPadding),
                        leading: Image.network(product.image),
                        title: Text(product.title),
                        subtitle: Text(product.brandName),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${product.priceAfetDiscount ?? product.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            if (product.dicountpercent != null)
                              Text(
                                '${product.dicountpercent}% Off',
                                style: TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                        onTap: () {
                          // Navigate to product details or allow removal
                          // For now, just a placeholder
                        },
                      );
                    },
                  ),
                ),
                // Display total and checkout button
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Text(
                        'Total: \$${calculateTotal().toStringAsFixed(2)}',
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
