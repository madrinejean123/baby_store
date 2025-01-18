import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Shop',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/babyBeds': (context) => const BabyBedsScreen(),
        '/babyClothing': (context) => const BabyClothingScreen(),
        '/babyShoes': (context) => const BabyShoesScreen(),
        '/babyFurniture': (context) => const BabyFurnitureScreen(),
        '/babyToys': (context) => const BabyToysScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Baby Shop")),
      body: ListView(
        children: [
          ExpansionCategory(
            title: 'Baby Products',
            svgSrc: 'assets/icons/baby.svg',
            subCategory: [
              SubCategory(title: 'Baby Beds', route: '/babyBeds'),
              SubCategory(title: 'Baby Clothing', route: '/babyClothing'),
              SubCategory(title: 'Baby Shoes', route: '/babyShoes'),
              SubCategory(title: 'Baby Furniture', route: '/babyFurniture'),
              SubCategory(title: 'Baby Toys', route: '/babyToys'),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpansionCategory extends StatelessWidget {
  const ExpansionCategory({
    super.key,
    required this.title,
    required this.subCategory,
    required this.svgSrc,
  });

  final String title, svgSrc;
  final List<SubCategory> subCategory;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Theme.of(context).textTheme.bodyLarge!.color,
      collapsedIconColor: Theme.of(context).textTheme.bodyMedium!.color,
      leading: SvgPicture.asset(
        svgSrc,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14),
      ),
      textColor: Theme.of(context).textTheme.bodyLarge!.color,
      childrenPadding: const EdgeInsets.only(left: 20.0),
      children: List.generate(
        subCategory.length,
        (index) => Column(
          children: [
            ListTile(
              onTap: () {
                // Navigate to the appropriate screen based on subcategory
                Navigator.pushNamed(context, subCategory[index].route);
              },
              title: Text(
                subCategory[index].title,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            if (index < subCategory.length - 1) const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}

class SubCategory {
  final String title;
  final String route;

  SubCategory({required this.title, required this.route});
}

// Dummy Screens for each subcategory
class BabyBedsScreen extends StatelessWidget {
  const BabyBedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Baby Beds")),
      body: const Center(child: Text("List of Baby Beds")),
    );
  }
}

class BabyClothingScreen extends StatelessWidget {
  const BabyClothingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Baby Clothing")),
      body: const Center(child: Text("List of Baby Clothing")),
    );
  }
}

class BabyShoesScreen extends StatelessWidget {
  const BabyShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Baby Shoes")),
      body: const Center(child: Text("List of Baby Shoes")),
    );
  }
}

class BabyFurnitureScreen extends StatelessWidget {
  const BabyFurnitureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Baby Furniture")),
      body: const Center(child: Text("List of Baby Furniture")),
    );
  }
}

class BabyToysScreen extends StatelessWidget {
  const BabyToysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Baby Toys")),
      body: const Center(child: Text("List of Baby Toys")),
    );
  }
}
