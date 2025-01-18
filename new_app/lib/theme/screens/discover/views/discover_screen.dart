import 'package:flutter/material.dart';
import 'package:shop/constants.dart';
import 'package:shop/screens/search/views/components/search_form.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({super.key}); // Removed const here

  final List<Map<String, dynamic>> babyCategories = [
    {
      "title": "Baby Mats",
      "svgSrc":
          "assets/icons/baby_mats.svg", // Replace with actual SVG/image paths
      "subCategories": ["Play Mats", "Foam Mats", "Carpet Mats"]
    },
    {
      "title": "Baby Shoes",
      "svgSrc": "assets/icons/baby_shoes.svg",
      "subCategories": ["Booties", "Sneakers", "Slippers"]
    },
    {
      "title": "Baby Wardrobe",
      "svgSrc": "assets/icons/baby_wardrobe.svg",
      "subCategories": ["Wooden Wardrobes", "Portable Wardrobes", "Closets"]
    },
    {
      "title": "Baby Bed",
      "svgSrc": "assets/icons/baby_bed.svg",
      "subCategories": ["Cribs", "Co-Sleepers", "Bassinets"]
    },
    {
      "title": "Baby Sweaters",
      "svgSrc": "assets/icons/baby_sweater.svg",
      "subCategories": ["Knitted Sweaters", "Cardigans", "Jackets"]
    },
    {
      "title": "Baby Bottles",
      "svgSrc": "assets/icons/baby_bottles.svg",
      "subCategories": [
        "Glass Bottles",
        "Plastic Bottles",
        "Sterilized Bottles"
      ]
    },
    {
      "title": "Baby Carrier",
      "svgSrc": "assets/icons/baby_carrier.svg",
      "subCategories": ["Baby Slings", "Backpacks", "Front Carriers"]
    },
    {
      "title": "Baby Blanket",
      "svgSrc": "assets/icons/baby_blanket.svg",
      "subCategories": [
        "Cotton Blankets",
        "Fleece Blankets",
        "Swaddle Blankets"
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover Baby Categories"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child:
                  SearchForm(), // Search form for finding specific baby products
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                "Categories",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: babyCategories.length,
                itemBuilder: (context, index) {
                  final category = babyCategories[index];
                  return ExpansionCategory(
                    svgSrc: category["svgSrc"]!,
                    title: category["title"]!,
                    subCategory: category["subCategories"]!,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExpansionCategory extends StatelessWidget {
  final String svgSrc;
  final String title;
  final List<String> subCategory;

  const ExpansionCategory({
    super.key,
    required this.svgSrc,
    required this.title,
    required this.subCategory,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Image.asset(
        svgSrc, // Assuming it's an image, adjust as needed for SVG or asset path
        width: 40,
        height: 40,
      ),
      title: Text(title),
      children: subCategory
          .map(
            (subCat) => Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
              child: ListTile(
                title: Text(subCat),
                onTap: () {
                  // Navigate to product list or details for each subcategory
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
