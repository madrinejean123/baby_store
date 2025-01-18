import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Shop',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/babyBeds': (context) => BabyBedsScreen(),
        '/babyClothing': (context) => BabyClothingScreen(),
        '/babyShoes': (context) => BabyShoesScreen(),
        '/babyFurniture': (context) => BabyFurnitureScreen(),
        '/babyToys': (context) => BabyToysScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Baby Shop")),
      body: ListView(
        children: [
          ExpansionCategory(
            title: 'Baby Products',
            svgSrc: 'assets/icons/baby.svg',
            subCategory: [
              SubCategory(title: 'Baby Beds'),
              SubCategory(title: 'Baby Clothing'),
              SubCategory(title: 'Baby Shoes'),
              SubCategory(title: 'Baby Furniture'),
              SubCategory(title: 'Baby Toys'),
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
                if (subCategory[index].title == "Baby Beds") {
                  Navigator.pushNamed(context, '/babyBeds');
                } else if (subCategory[index].title == "Baby Clothing") {
                  Navigator.pushNamed(context, '/babyClothing');
                } else if (subCategory[index].title == "Baby Shoes") {
                  Navigator.pushNamed(context, '/babyShoes');
                } else if (subCategory[index].title == "Baby Furniture") {
                  Navigator.pushNamed(context, '/babyFurniture');
                } else if (subCategory[index].title == "Baby Toys") {
                  Navigator.pushNamed(context, '/babyToys');
                }
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

  SubCategory({required this.title});
}

// Dummy Screens for each subcategory
class BabyBedsScreen extends StatelessWidget {
  const BabyBedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Baby Beds")),
      body: Center(child: Text("List of Baby Beds")),
    );
  }
}

class BabyClothingScreen extends StatelessWidget {
  const BabyClothingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Baby Clothing")),
      body: Center(child: Text("List of Baby Clothing")),
    );
  }
}

class BabyShoesScreen extends StatelessWidget {
  const BabyShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Baby Shoes")),
      body: Center(child: Text("List of Baby Shoes")),
    );
  }
}

class BabyFurnitureScreen extends StatelessWidget {
  const BabyFurnitureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Baby Furniture")),
      body: Center(child: Text("List of Baby Furniture")),
    );
  }
}

class BabyToysScreen extends StatelessWidget {
  const BabyToysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Baby Toys")),
      body: Center(child: Text("List of Baby Toys")),
    );
  }
}
