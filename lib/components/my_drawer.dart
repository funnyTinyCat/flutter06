import 'package:ecommerce_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [          
          Column(
            children: [
            //
              // drawer header: logo            
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag, 
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(height: 24,),
              // shop tile
              MyListTile(
                text: "Shop", 
                icon: Icons.home,
                onTap: () { 
                  // pop drawer first 
                  Navigator.pop(context);

                  // go to shop page
               //   Navigator.pushNamed(context, '/shop_page');
                }
              ),
              // cart tile
              MyListTile(
                text: "Cart", 
                icon: Icons.shopping_cart, 
                onTap: () {
                  // pop drawer first
                  Navigator.pop(context);

                  // go to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),


        
          // exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: MyListTile(
              text: "Exit", 
              icon: Icons.logout, 
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, "/intro_page", 
                (route) => false
              ),
            ),
          ),

        ],
      ),
    );
  }
}