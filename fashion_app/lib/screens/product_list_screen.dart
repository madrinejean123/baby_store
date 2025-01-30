import 'package:flutter/material.dart';
import 'package:my_fashion_app/main.dart';
import 'package:my_fashion_app/models/product.dart';
import 'package:my_fashion_app/pages/product_detail_screen.dart';
import 'package:my_fashion_app/screens/about.dart';
import 'package:my_fashion_app/screens/cart.dart';
import 'package:my_fashion_app/screens/products.dart';

import 'dart:async';

import 'package:my_fashion_app/services/product_service.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<String> allimages = [
    'assets/baby_sweater.png',
    'assets/baby_shoes.png',
    'assets/baby_onesie.png',
    'assets/baby_hat.png',
    'assets/baby_jacket.png',
    'assets/baby_mittens_socks.png',
    'assets/baby_romper.png',
    'assets/baby_sleepwear.png',
    'assets/baby_pants.png',
    'assets/baby_hooded_towel.png',
    'assets/baby_cardigan.png',
    'assets/baby_footed_pajamas.png',
    'assets/baby_jacket_fur.png',
    'assets/baby_gloves.png',
    'assets/baby_leggings.png',
    'assets/baby_summer_dress.png',
    'assets/baby_denim_shorts.png',
    'assets/baby_romper_set.png',
    'assets/baby_sweatshirt.png',
    'assets/baby_winter_coat.png',
    'assets/baby_sun_hat.png',
    'assets/baby_pajamas.png',
    'assets/baby_skirt.png',
    'assets/baby_swimwear.png',
    'assets/baby_snowsuit.png',
    'assets/baby_tights.png',
    'assets/baby_bibs.png',
    'assets/baby_jacket_hood.png',
    'assets/baby_booties.png',
  ];
  final ProductService productService = ProductService();
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchFocused = false;
  late Timer _timer;
  int currentIndex = 0;
  @override
  @override
  void dispose() {
    _searchController.dispose();
    _timer.cancel(); // cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // start the timer when the widget is initialized
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % allimages.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isSearchFocused) {
          setState(() {
            _isSearchFocused = false;
          });
          _searchController.clear();
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 192, 203),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 192, 203),
          elevation: 0,
          toolbarHeight: 50,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: const Color.fromARGB(255, 32, 1, 1),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Text(
            'Baby Fashion App',
            style: TextStyle(
              color: Color.fromARGB(255, 180, 103, 3),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: Color.fromARGB(255, 141, 71, 71), width: 2),
              ),
              child: IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('assets/backc.png'),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 255, 192, 203),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 192, 203),
                      Color.fromARGB(255, 255, 192, 203),
                    ],
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/draw.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Baby Fashion App',
                    style: TextStyle(
                      color: Color.fromARGB(255, 223, 128, 5),
                      fontSize: 30,
                      fontFamily: 'times new roman',
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Color.fromARGB(255, 180, 103, 3),
                  ),
                ),
                leading: Icon(Icons.home,
                    color: const Color.fromARGB(255, 32, 1, 1)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
              ListTile(
                title: Text(
                  'Products',
                  style: TextStyle(color: Color.fromARGB(255, 180, 103, 3)),
                ),
                leading: Icon(Icons.shopping_bag,
                    color: const Color.fromARGB(255, 27, 1, 1)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Productss()));
                },
              ),
              ListTile(
                title: Text(
                  'My Cart',
                  style: TextStyle(
                    color: Color.fromARGB(255, 180, 103, 3),
                  ),
                ),
                leading: Icon(Icons.shopping_cart,
                    color: const Color.fromARGB(255, 29, 1, 1)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
              ),
              ListTile(
                title: Text(
                  'About Us',
                  style: TextStyle(
                    color: Color.fromARGB(255, 180, 103, 3),
                  ),
                ),
                leading: Icon(Icons.info,
                    color: const Color.fromARGB(255, 31, 1, 1)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Discover best baby clothings',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromARGB(255, 180, 103, 3),
                  fontSize: 25,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Choose and buy',
                  style: TextStyle(
                    color: Color.fromARGB(255, 180, 103, 3),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: _isSearchFocused ? 350 : 350,
                decoration: BoxDecoration(
                  color: Color.fromARGB(173, 173, 216, 230),
                  border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for products',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 180, 103, 3),
                        ),
                      ),
                      style: TextStyle(
                        color: Color.fromARGB(255, 68, 31, 1),
                      ),
                      cursorHeight: 20,
                      cursorWidth: 2,
                      cursorColor: Color.fromARGB(255, 5, 0, 0),
                      textInputAction: TextInputAction.search,
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      autofocus: true,
                      onChanged: (value) {
                        setState(
                            () {}); // Trigger rebuild to update the filtered list
                      },
                      onSubmitted: (value) {
                        // Perform search
                      },
                    )),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 12, 0, 0),
                      ),
                      onPressed: () {
                        setState(() {
                          _isSearchFocused = !_isSearchFocused;
                          if (!_isSearchFocused) {
                            _searchController.clear();
                            FocusScope.of(context).unfocus();
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 240,
                width: 360,
                child: PageView.builder(
                  itemCount: allimages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              allimages[
                                  (index + currentIndex) % allimages.length],
                              fit: BoxFit.cover,
                              height: 240,
                              width: 360,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Color.fromARGB(255, 255, 192, 203)
                                ],
                              ),
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Productss()),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 255, 192, 203)),
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.0, vertical: 2.0),
                                    child: Text(
                                      'Learn More',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 180, 103, 3),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'times new roman',
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 8.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    SizedBox(width: 4.0),
                                    Icon(
                                      Icons.circle,
                                      size: 8.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    SizedBox(width: 4.0),
                                    Icon(
                                      Icons.circle,
                                      size: 8.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(173, 173, 216, 230),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Arrival Collection',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 180, 103, 3),
                              fontFamily: 'times new roman',
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 192, 203),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Productss()));
                              },
                              child: Text(
                                'See all',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 180, 103, 3),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 10,
                        children: [
                          FilterButton(
                            label: 'Popular',
                            isSelected: false,
                            onPressed: () {},
                          ),
                          FilterButton(
                            label: 'Trending',
                            isSelected: false,
                          ),
                          FilterButton(
                            label: 'New',
                            isSelected: false,
                          ),
                          FilterButton(
                            label: 'Summer',
                            isSelected: false,
                          ),
                          FilterButton(
                            label: 'OverSize',
                            isSelected: false,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 220,
                      width: 380,
                      child: FutureBuilder<List<Product>>(
                        future: productService.getProducts(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Product>> snapshot) {
                          if (snapshot.hasData) {
                            List<Product> products = snapshot.data!;
                            if (_searchController.text.isNotEmpty) {
                              products = products
                                  .where((product) => product.title
                                      .toLowerCase()
                                      .contains(
                                          _searchController.text.toLowerCase()))
                                  .toList();
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              itemBuilder: (BuildContext context, int index) {
                                Product product = products[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailScreen(
                                                product: product),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 190,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              product.image,
                                              fit: BoxFit.cover,
                                              height: 150,
                                              width: 150,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          product.title,
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 180, 103, 3),
                                            fontSize: 20,
                                            fontFamily: 'times new roman',
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Price : \$${product.price.toString()}',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 3, 3, 0),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'times new roman',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          // By default, show a loading spinner.
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Loading...',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 4,
                              width: 100,
                              color: Color.fromARGB(255, 255, 192, 203),
                              margin: EdgeInsets.only(top: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Recommended for you',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 180, 103, 3),
                                      fontFamily: 'times new roman',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 220,
                              width: 380,
                              child: FutureBuilder<List<Product>>(
                                future: productService.getProducts(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Product>> snapshot) {
                                  if (snapshot.hasData) {
                                    List<Product> products = snapshot.data!;

                                    return GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, // number of columns
                                        crossAxisSpacing:
                                            10, // horizontal spacing between columns
                                        mainAxisSpacing:
                                            10, // vertical spacing between rows
                                        childAspectRatio:
                                            0.8, // width to height ratio of each grid item
                                      ),
                                      itemCount: products.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Product product = products[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetailScreen(
                                                        product: product),
                                              ),
                                            );
                                          },
                                          child: SizedBox(
                                            width: 190,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.asset(
                                                      product.image,
                                                      fit: BoxFit.cover,
                                                      height: 150,
                                                      width: 150,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  product.title,
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 233, 96, 6),
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'times new roman',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(height: 10),
                                                SizedBox(height: 20),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  // By default, show a loading spinner.
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          'Loading...',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onPressed;

  const FilterButton({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isSelected ? Color.fromARGB(255, 0, 0, 0) : Colors.white;
    final textColor =
        isSelected ? Color.fromARGB(255, 255, 255, 255) : Colors.black;
    final borderColor = isSelected
        ? Color.fromARGB(255, 0, 0, 0)
        : Color.fromARGB(255, 0, 0, 0);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
