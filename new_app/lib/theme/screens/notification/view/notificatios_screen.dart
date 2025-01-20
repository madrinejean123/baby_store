import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.lightBlueAccent, // Baby-themed color
        actions: [
          IconButton(
            onPressed: () {
              // Placeholder for additional actions
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("More options")),
              );
            },
            icon: SvgPicture.asset(
              "assets/icons/DotsV.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NotificationTile(
            title: "Baby Sale Alert!",
            description: "Up to 50% off on baby clothing and toys.",
            icon: Icons.discount,
          ),
          NotificationTile(
            title: "New Arrivals",
            description: "Check out the latest baby items in our collection.",
            icon: Icons.new_releases,
          ),
          NotificationTile(
            title: "Stock Update",
            description: "Your favorite baby products are back in stock.",
            icon: Icons.notifications,
          ),
          NotificationTile(
            title: "Exclusive Deals",
            description: "Sign up now for members-only discounts on baby gear.",
            icon: Icons.card_giftcard,
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const NotificationTile({
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.lightBlueAccent),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Add on-tap functionality here
        },
      ),
    );
  }
}
