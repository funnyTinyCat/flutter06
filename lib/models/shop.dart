import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {

  // products for sale
  final List<Product> _shop = [
    // product 1
    Product(name: "product 1", price: 10, description: "product 1 description", 
      imagePath: 'assets/glasses.png'
    ),
    Product(name: "product 2", price: 20, description: "product 2 description", 
      imagePath: 'assets/shoes.png'
    ),
    Product(name: "product 3", price: 30, description: "product 3 description", 
      imagePath: 'assets/hoodie.png'
    ),
    Product(name: "product 4", price: 40, description: "product 4 description", 
      imagePath: 'assets/watch.png'
    ),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item); 
    notifyListeners();
  }
}