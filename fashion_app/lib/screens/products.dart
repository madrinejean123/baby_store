import 'package:flutter/material.dart';
import 'package:my_fashion_app/models/product.dart';
import 'package:my_fashion_app/pages/product_detail_screen.dart';
import 'package:my_fashion_app/services/product_service.dart';

class Productss extends StatefulWidget {
  const Productss({super.key});

  @override
  _ProductssState createState() => _ProductssState();
}

class _ProductssState extends State<Productss> {
  final ProductService productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 192, 203),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(173, 173, 216, 230),
        title: Text('All our products'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: const Color.fromARGB(255, 15, 1, 1),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Select the item you are interested ',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromARGB(255, 223, 122, 7),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'times new roman',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'List of the available products',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 204, 84, 4),
                  fontSize: 18,
                ),
              ),
            ),
            FutureBuilder<List<Product>>(
              future: productService.getProducts(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Product>> snapshot) {
                if (snapshot.hasData) {
                  List<Product> products = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(product: product),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(173, 173, 216, 230),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  product.image,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: TextStyle(
                                        color:
                                            const Color.fromARGB(255, 17, 1, 1),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '\$${product.price.toString()}',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 218, 124, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      product.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 218, 124, 1),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
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
                        color: const Color.fromARGB(255, 14, 0, 0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Loading...',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 209, 85, 1)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
