import 'package:flutter/material.dart';
import 'package:shop/screens/search/views/components/search_form.dart';

// Category Model with subcategories (list of categories)
class CategoryModel {
  final String title;
  final String? image, svgSrc;
  final List<CategoryModel>? subCategories;

  CategoryModel({
    required this.title,
    this.image,
    this.svgSrc,
    this.subCategories,
  });
}

// List with Baby products categories and images
final List<CategoryModel> demoCategoriesWithImage = [
  CategoryModel(
    title: "Baby Mats",
    image:
        "https://i.pinimg.com/736x/00/19/43/001943403a59a76a60ebfe7ceb73f9c6.jpg",
  ),
  CategoryModel(
    title: "Baby Shoes",
    image:
        "https://i.pinimg.com/236x/89/3b/e4/893be4fa52184e1c9f2bb273bd6927a8.jpg",
  ),
  CategoryModel(
    title: "Baby Wardrobe",
    image:
        "https://i.pinimg.com/236x/8c/cb/94/8ccb94972623b3ab38e353fda8b5c569.jpg",
  ),
  CategoryModel(
    title: "Baby Bed",
    image:
        "https://i.pinimg.com/236x/71/7e/e8/717ee8c55e5cbe19ceeafd19f632fc3d.jpg",
  ),
  CategoryModel(
    title: "Baby Sweater",
    image:
        "https://i.pinimg.com/236x/2d/d0/59/2dd059f609fddcee18e988f0ed61c0ed.jpg",
  ),
  CategoryModel(
    title: "Baby Bottles",
    image:
        "https://i.pinimg.com/236x/40/64/b7/4064b7e8590e90397068ec7a2727168d.jpg",
  ),
  CategoryModel(
    title: "Baby Carrier",
    image:
        "https://i.pinimg.com/236x/7a/b7/f5/7ab7f5f4f2c17e91b5399d9371607392.jpg",
  ),
  CategoryModel(
    title: "Baby Blanket",
    image:
        "https://i.pinimg.com/236x/7a/b7/f5/7ab7f5f4f2c17e91b5399d9371607392.jpg",
  ),
];

// List with Baby product categories and subcategories
final List<CategoryModel> demoCategories = [
  CategoryModel(
    title: "On Sale",
    svgSrc: "assets/icons/Sale.svg",
    subCategories: [
      CategoryModel(
          title: "Baby Mats",
          image:
              "https://i.pinimg.com/736x/00/19/43/001943403a59a76a60ebfe7ceb73f9c6.jpg"),
      CategoryModel(
          title: "Baby Shoes",
          image:
              "https://i.pinimg.com/236x/89/3b/e4/893be4fa52184e1c9f2bb273bd6927a8.jpg"),
      CategoryModel(
          title: "Baby Wardrobe",
          image:
              "https://i.pinimg.com/236x/8c/cb/94/8ccb94972623b3ab38e353fda8b5c569.jpg"),
    ],
  ),
  CategoryModel(
    title: "Baby Clothing",
    svgSrc: "assets/icons/Clothing.svg",
    subCategories: [
      CategoryModel(
          title: "Baby Sweaters",
          image:
              "https://i.pinimg.com/236x/2d/d0/59/2dd059f609fddcee18e988f0ed61c0ed.jpg"),
      CategoryModel(
          title: "Baby Jackets",
          image:
              "https://i.pinimg.com/236x/2d/d0/59/2dd059f609fddcee18e988f0ed61c0ed.jpg"),
    ],
  ),
  CategoryModel(
    title: "Baby Essentials",
    svgSrc: "assets/icons/Essentials.svg",
    subCategories: [
      CategoryModel(
          title: "Baby Bottles",
          image:
              "https://i.pinimg.com/236x/40/64/b7/4064b7e8590e90397068ec7a2727168d.jpg"),
      CategoryModel(
          title: "Baby Blankets",
          image:
              "https://i.pinimg.com/236x/7a/b7/f5/7ab7f5f4f2c17e91b5399d9371607392.jpg"),
    ],
  ),
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover Baby Categories"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child:
                  SearchForm(), // Search form for finding specific baby products
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Categories",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: demoCategories.length,
                itemBuilder: (context, index) {
                  final category = demoCategories[index];
                  return ExpansionTile(
                    leading: Image.asset(
                      category.svgSrc ?? "", // Assuming it's an SVG icon
                      width: 40,
                      height: 40,
                    ),
                    title: Text(category.title),
                    children: category.subCategories
                            ?.map(
                              (subCategory) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ListTile(
                                  leading:
                                      Image.network(subCategory.image ?? ""),
                                  title: Text(subCategory.title),
                                  onTap: () {
                                    // Navigate to product list or details for each subcategory
                                  },
                                ),
                              ),
                            )
                            .toList() ??
                        [],
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
