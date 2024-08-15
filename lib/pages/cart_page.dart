import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/components/my_product_tile.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    //
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
   
          // yes button
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          
          ),
        ],
      ),
    );    
  }

  // user pressed pay button
  void payButtonPressed(BuildContext context) {
    //
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: Text("User wants to pay. Connect your app to backend payment."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;


    return Scaffold(
      appBar: AppBar(
        //
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
   //   drawer: const MyDrawer(),
   body: Column(
    children: [
      // cart list
      Expanded(
        child: cart.isEmpty ? Center(child: const Text("Your cart is empty.")) : ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            // get individual item in cart
            final item = cart[index];
            // return as a cart tile UI
            return ListTile( 
              title: Text(item.name),
              subtitle: Text(item.price.toStringAsFixed(2),),
              trailing: IconButton(
                onPressed: () => removeItemFromCart(context, item), 
                icon: Icon(Icons.remove,),
              ),
            );
          },
        ),
      ),

      // pay button
      Padding(
        padding: const EdgeInsets.all(50.0),
        child: MyButton(
          onTap: () => payButtonPressed(context), 
          child: const Text("PAY NOW"),
        ),
      ),
    ],
   ),
    );
  }
}