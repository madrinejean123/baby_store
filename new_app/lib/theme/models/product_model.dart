// For demo only

class ProductModel {
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
  });
}

List<ProductModel> demoPopularProducts = [
  ProductModel(
    image:
        "https://i.pinimg.com/736x/00/19/43/001943403a59a76a60ebfe7ceb73f9c6.jpg", // Baby Mat
    title: "Baby Mat",
    brandName: "Baby Care",
    price: 540,
    priceAfetDiscount: 420,
    dicountpercent: 20,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/89/3b/e4/893be4fa52184e1c9f2bb273bd6927a8.jpg", // Baby Shoes
    title: "Baby Shoes",
    brandName: "Little Steps",
    price: 800,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/8c/cb/94/8ccb94972623b3ab38e353fda8b5c569.jpg", // Baby Wardrobe
    title: "Baby Wardrobe",
    brandName: "Tiny Treasures",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/71/7e/e8/717ee8c55e5cbe19ceeafd19f632fc3d.jpg", // Baby Bed
    title: "Baby Bed",
    brandName: "Dreamland",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/2d/d0/59/2dd059f609fddcee18e988f0ed61c0ed.jpg", // Baby Sweater
    title: "Baby Sweater",
    brandName: "Baby Cozy",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/40/64/b7/4064b7e8590e90397068ec7a2727168d.jpg", // Baby Bottles
    title: "Baby Bottles",
    brandName: "Tiny Sips",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
];

List<ProductModel> demoFlashSaleProducts = [
  ProductModel(
    image:
        "https://i.pinimg.com/236x/2d/d0/59/2dd059f609fddcee18e988f0ed61c0ed.jpg", // Baby Sweater
    title: "Baby Sweater",
    brandName: "Baby Cozy",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/71/7e/e8/717ee8c55e5cbe19ceeafd19f632fc3d.jpg", // Baby Bed
    title: "Baby Bed",
    brandName: "Dreamland",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/8c/cb/94/8ccb94972623b3ab38e353fda8b5c569.jpg", // Baby Wardrobe
    title: "Baby Wardrobe",
    brandName: "Tiny Treasures",
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15,
  ),
];

List<ProductModel> demoBestSellersProducts = [
  ProductModel(
    image:
        "https://i.pinimg.com/236x/40/64/b7/4064b7e8590e90397068ec7a2727168d.jpg", // Baby Bottles
    title: "Baby Bottles",
    brandName: "Tiny Sips",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/2d/d0/59/2dd059f609fddcee18e988f0ed61c0ed.jpg", // Baby Sweater
    title: "Baby Sweater",
    brandName: "Baby Cozy",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/8c/cb/94/8ccb94972623b3ab38e353fda8b5c569.jpg", // Baby Wardrobe
    title: "Baby Wardrobe",
    brandName: "Tiny Treasures",
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15,
  ),
];

List<ProductModel> kidsProducts = [
  ProductModel(
    image:
        "https://i.pinimg.com/236x/7a/b7/f5/7ab7f5f4f2c17e91b5399d9371607392.jpg", // Baby Carrier
    title: "Baby Carrier",
    brandName: "Tiny Steps",
    price: 650.62,
    priceAfetDiscount: 590.36,
    dicountpercent: 24,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/40/64/b7/4064b7e8590e90397068ec7a2727168d.jpg", // Baby Bottles
    title: "Baby Bottles",
    brandName: "Tiny Sips",
    price: 650.62,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/71/7e/e8/717ee8c55e5cbe19ceeafd19f632fc3d.jpg", // Baby Bed
    title: "Baby Bed",
    brandName: "Dreamland",
    price: 400,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/8c/cb/94/8ccb94972623b3ab38e353fda8b5c569.jpg", // Baby Wardrobe
    title: "Baby Wardrobe",
    brandName: "Tiny Treasures",
    price: 400,
    priceAfetDiscount: 360,
    dicountpercent: 20,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/2d/d0/59/2dd059f609fddcee18e988f0ed61c0ed.jpg", // Baby Sweater
    title: "Baby Sweater",
    brandName: "Baby Cozy",
    price: 654,
  ),
  ProductModel(
    image:
        "https://i.pinimg.com/236x/7a/b7/f5/7ab7f5f4f2c17e91b5399d9371607392.jpg", // Baby Carrier
    title: "Baby Carrier",
    brandName: "Tiny Steps",
    price: 250,
  ),
];
