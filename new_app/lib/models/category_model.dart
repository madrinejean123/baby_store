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

final List<CategoryModel> demoCategoriesWithImage = [
  CategoryModel(
      title: "Baby Clothing", image: "assets/images/baby_clothing.png"),
  CategoryModel(title: "Baby Toys", image: "assets/images/baby_toys.png"),
  CategoryModel(
      title: "Baby Furniture", image: "assets/images/baby_furniture.png"),
  CategoryModel(
      title: "Baby Accessories", image: "assets/images/baby_accessories.png"),
];

final List<CategoryModel> demoCategories = [
  CategoryModel(
    title: "On Sale",
    svgSrc: "assets/icons/sale.svg",
    subCategories: [
      CategoryModel(title: "Baby Clothes"),
      CategoryModel(title: "Baby Shoes"),
      CategoryModel(title: "Baby Toys"),
      CategoryModel(title: "Baby Furniture"),
      CategoryModel(title: "Baby Accessories"),
    ],
  ),
  CategoryModel(
    title: "Clothing & Accessories",
    svgSrc: "assets/icons/clothing.svg",
    subCategories: [
      CategoryModel(title: "Baby Onesies"),
      CategoryModel(title: "Baby Dresses"),
      CategoryModel(title: "Baby Sweaters"),
      CategoryModel(title: "Baby Shoes"),
    ],
  ),
  CategoryModel(
    title: "Furniture & Bedding",
    svgSrc: "assets/icons/furniture.svg",
    subCategories: [
      CategoryModel(title: "Baby Cribs"),
      CategoryModel(title: "Baby Mattresses"),
      CategoryModel(title: "Baby Wardrobes"),
      CategoryModel(title: "Baby Blankets"),
    ],
  ),
  CategoryModel(
    title: "Toys",
    svgSrc: "assets/icons/toys.svg",
    subCategories: [
      CategoryModel(title: "Soft Toys"),
      CategoryModel(title: "Activity Toys"),
      CategoryModel(title: "Musical Toys"),
      CategoryModel(title: "Educational Toys"),
    ],
  ),
];
