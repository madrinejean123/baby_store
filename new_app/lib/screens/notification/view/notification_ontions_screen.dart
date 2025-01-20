import 'package:flutter/material.dart';

class NotificationOptionsScreen extends StatelessWidget {
  const NotificationOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Settings"),
        backgroundColor: Colors.lightBlueAccent, // Baby-themed color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Manage Notifications",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.notifications_active,
                  color: Colors.lightBlueAccent),
              title: const Text("Push Notifications"),
              subtitle:
                  const Text("Receive updates about new baby items and offers"),
              trailing: Switch(
                value: true, // Default state
                onChanged: (value) {
                  // Handle toggle logic here
                },
                activeColor: Colors.lightBlueAccent,
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.lightBlueAccent),
              title: const Text("Email Notifications"),
              subtitle:
                  const Text("Get personalized recommendations via email"),
              trailing: Switch(
                value: false, // Default state
                onChanged: (value) {
                  // Handle toggle logic here
                },
                activeColor: Colors.lightBlueAccent,
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.sms, color: Colors.lightBlueAccent),
              title: const Text("SMS Notifications"),
              subtitle:
                  const Text("Receive SMS alerts for discounts and promotions"),
              trailing: Switch(
                value: false, // Default state
                onChanged: (value) {
                  // Handle toggle logic here
                },
                activeColor: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
