import 'package:flutter/foundation.dart';
import 'package:my_fashion_app/models/cartt.dart';
import 'package:my_fashion_app/services/product_service.dart';

class Cart with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    ProductService;
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
