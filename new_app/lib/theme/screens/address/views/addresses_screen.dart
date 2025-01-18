import 'package:flutter/material.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Baby's Delivery Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Delivery Address for Baby Products",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Street Address
            TextField(
              decoration: InputDecoration(
                labelText: "Street Address",
                hintText: "Enter street address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // City
            TextField(
              decoration: InputDecoration(
                labelText: "City",
                hintText: "Enter city",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Postal Code
            TextField(
              decoration: InputDecoration(
                labelText: "Postal Code",
                hintText: "Enter postal code",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Country
            TextField(
              decoration: InputDecoration(
                labelText: "Country",
                hintText: "Enter country",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Baby Product Delivery Option
            const Text(
              "Select Delivery Type",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Delivery Option",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Standard',
                  child: Text("Standard Delivery"),
                ),
                DropdownMenuItem(
                  value: 'Express',
                  child: Text("Express Delivery"),
                ),
              ],
              onChanged: (value) {
                // Handle the selected delivery type
              },
            ),
            const SizedBox(height: 16),

            // Save Address Button
            ElevatedButton(
              onPressed: () {
                // Implement functionality to save the address
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Address Saved")),
                );
              },
              child: const Text("Save Address"),
            ),
          ],
        ),
      ),
    );
  }
}
