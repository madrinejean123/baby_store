import 'package:flutter/material.dart';
import 'package:my_fashion_app/models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Product product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 192, 203),
        title: Text(
          product.title,
          style: TextStyle(color: Color.fromARGB(255, 192, 94, 3)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 70,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2 + 50,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(173, 173, 216, 230),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Product title
                    Text(
                      product.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 192, 94, 3),
                        fontFamily: 'times new roman',
                      ),
                    ),
                    SizedBox(height: 10),
                    // Product price with color dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: TextStyle(fontSize: 26, color: Colors.white),
                        ),
                        ColorDotsRow(
                          colors: [
                            const Color.fromARGB(255, 3, 70, 124),
                            const Color.fromARGB(255, 128, 75, 75),
                            const Color.fromARGB(255, 2, 121, 6)
                          ],
                          size: 24,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Sizes
                    Text(
                      'Size',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 192, 94, 3),
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FilterButton(
                            label: 'S',
                            isSelected: false,
                            onPressed: () {},
                          ),
                          SizedBox(width: 10),
                          FilterButton(
                            label: 'M',
                            isSelected: false,
                          ),
                          SizedBox(width: 10),
                          FilterButton(
                            label: 'L',
                            isSelected: false,
                          ),
                          SizedBox(width: 10),
                          FilterButton(
                            label: 'XL',
                            isSelected: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    Container(
                      child: Text(
                        product.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 27, 1, 1),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedButton(),
                          SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isSuccess = false;

  void _onPressed() {
    setState(() {
      _isSuccess = !_isSuccess;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: _isSuccess ? Colors.green : Colors.black,
        borderRadius: BorderRadius.circular(_isSuccess ? 50.0 : 30.0),
      ),
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 255, 192, 203),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_isSuccess ? 50.0 : 30.0),
            side: BorderSide(color: Colors.white, width: 2.0),
          ),
        ),
        child: _isSuccess
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check, color: const Color.fromARGB(255, 26, 2, 2)),
                  SizedBox(width: 10),
                  Text(
                    'Buy Successful',
                    style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 87, 58, 3)),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart,
                      color: const Color.fromARGB(255, 26, 0, 0)),
                  SizedBox(width: 10),
                  Text(
                    'Buy Now',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 192, 94, 3)),
                  ),
                ],
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

class ColorDotsRow extends StatelessWidget {
  final List<Color> colors;
  final double size;

  const ColorDotsRow({super.key, required this.colors, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors.map((color) {
        return Container(
          margin: EdgeInsets.only(right: 10),
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        );
      }).toList(),
    );
  }
}
