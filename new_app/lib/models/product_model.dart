// For demo only

class ProductModel {
  final String image, brandName, title;
  final double price;
  final double? priceAfterDiscount;
  final int? discountPercent;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfterDiscount,
    this.discountPercent,
  });
}

List<ProductModel> demoPopularProducts = [
  ProductModel(
    image:
        "https://i.pinimg.com/736x/00/19/43/001943403a59a76a60ebfe7ceb73f9c6.jpg",
    title: "Soft Baby Play Mat",
    brandName: "Baby Comfort",
    price: 540,
    priceAfterDiscount: 420,
    discountPercent: 20,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/89/3b/e4/893be4fa52184e1c9f2bb273bd6927a8.jpg",
    title: "Cozy Baby Shoes",
    brandName: "Little Steps",
    price: 800,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/8c/cb/94/8ccb94972623b3ab38e353fda8b5c569.jpg",
    title: "Baby Wardrobe Organizer",
    brandName: "Tiny Tidy",
    price: 650.62,
    priceAfterDiscount: 390.36,
    discountPercent: 40,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/71/7e/e8/717ee8c55e5cbe19ceeafd19f632fc3d.jpg",
    title: "Comfortable Baby Bed",
    brandName: "Dreamland Baby",
    price: 1264,
    priceAfterDiscount: 1200.8,
    discountPercent: 5,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/2d/d0/59/2dd059f609fddcee18e988f0ed61c0ed.jpg",
    title: "Handmade Baby Sweater",
    brandName: "Warm Hugs",
    price: 650.62,
    priceAfterDiscount: 390.36,
    discountPercent: 40,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/42/11/8b/42118b7ca9aa2734baf7516355211f73.jpg",
    title: "Stylish Baby Sweater",
    brandName: "Warm Hugs",
    price: 1264,
    priceAfterDiscount: 1200.8,
    discountPercent: 5,
  ),
];

List<ProductModel> demoFlashSaleProducts = [
  ProductModel(
    image:
        "https://i.pinimg.com/236x/8c/cb/94/8ccb94972623b3ab38e353fda8b5c569.jpg",
    title: "Baby Wardrobe Organizer",
    brandName: "Tiny Tidy",
    price: 650.62,
    priceAfterDiscount: 390.36,
    discountPercent: 40,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/71/7e/e8/717ee8c55e5cbe19ceeafd19f632fc3d.jpg",
    title: "Comfortable Baby Bed",
    brandName: "Dreamland Baby",
    price: 1264,
    priceAfterDiscount: 1200.8,
    discountPercent: 5,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/89/3b/e4/893be4fa52184e1c9f2bb273bd6927a8.jpg",
    title: "Cozy Baby Shoes",
    brandName: "Little Steps",
    price: 800,
    priceAfterDiscount: 680,
    discountPercent: 15,
  ),
];

List<ProductModel> demoBestSellersProducts = [
  ProductModel(
    image:
        "https://i.pinimg.com/236x/2d/d0/59/2dd059f609fddcee18e988f0ed61c0ed.jpg",
    title: "Handmade Baby Sweater",
    brandName: "Warm Hugs",
    price: 650.62,
    priceAfterDiscount: 390.36,
    discountPercent: 40,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/42/11/8b/42118b7ca9aa2734baf7516355211f73.jpg",
    title: "Stylish Baby Sweater",
    brandName: "Warm Hugs",
    price: 1264,
    priceAfterDiscount: 1200.8,
    discountPercent: 5,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/89/3b/e4/893be4fa52184e1c9f2bb273bd6927a8.jpg",
    title: "Cozy Baby Shoes",
    brandName: "Little Steps",
    price: 800,
    priceAfterDiscount: 680,
    discountPercent: 15,
  ),
];

List<ProductModel> kidsProducts = [
  ProductModel(
    image:
        "https://i.pinimg.com/236x/00/19/43/001943403a59a76a60ebfe7ceb73f9c6.jpg",
    title: "Soft Baby Play Mat",
    brandName: "Baby Comfort",
    price: 650.62,
    priceAfterDiscount: 590.36,
    discountPercent: 24,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/7a/b7/f5/7ab7f5f4f2c17e91b5399d9371607392.jpg",
    title: "Adorable Baby Night Light",
    brandName: "Glow Buddies",
    price: 650.62,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/40/64/b7/4064b7e8590e90397068ec7a2727168d.jpg",
    title: "Baby Bottle Set",
    brandName: "Feeding Pro",
    price: 400,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/7a/b7/f5/7ab7f5f4f2c17e91b5399d9371607392.jpg",
    title: "Baby Blanket",
    brandName: "Snuggle Soft",
    price: 400,
    priceAfterDiscount: 360,
    discountPercent: 20,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/8c/cb/94/8ccb94972623b3ab38e353fda8b5c569.jpg",
    title: "Baby Carrier",
    brandName: "CarryEase",
    price: 654,
  ),
  ProductModel(
    image: "https://i.pinimg.com/236x/7fSxC7k.png",
    title: "Comfortable Baby Wardrobe",
    brandName: "Tiny Tidy",
    price: 250,
  ),
];
