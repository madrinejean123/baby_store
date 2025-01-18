import 'package:flutter/material.dart';

import '../../../constants.dart';

class DiscoverCategories extends StatelessWidget {
  final List<Map<String, String>> babyCategories = [
    {"title": "Baby Mats", "image": "assets/baby_mats.png"},
    {"title": "Baby Shoes", "image": "assets/baby_shoes.png"},
    {"title": "Baby Wardrobe", "image": "assets/baby_wardrobe.png"},
    {"title": "Baby Bed", "image": "assets/baby_bed.png"},
    {"title": "Baby Sweater", "image": "assets/baby_sweater.png"},
    {"title": "Baby Bottles", "image": "assets/baby_bottles.png"},
    {"title": "Baby Carrier", "image": "assets/baby_carrier.png"},
    {"title": "Baby Blanket", "image": "assets/baby_blanket.png"},
  ];

  DiscoverCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: babyCategories.length,
      itemBuilder: (context, index) {
        final category = babyCategories[index];
        return DiscoverCategoryItem(
          title: category['title']!,
          image: category['image']!,
        );
      },
    );
  }
}

class DiscoverCategoryItem extends StatelessWidget {
  final String title;
  final String image;

  const DiscoverCategoryItem({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding * 0.75),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: defaultPadding),
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16, color: primaryColor),
        ],
      ),
    );
  }
}
