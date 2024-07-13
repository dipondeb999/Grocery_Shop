import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_shop/model/cart_model.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Good morning
           const Padding(
             padding: EdgeInsets.only(left: 24, top: 72),
             child: Text('Good morning'),
           ),
            // Let's order fresh items for you
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 5),
              child: Text(
                  "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // fresh items
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 48),
              child: Divider(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 48),
              child: Text(
                'Fresh items',
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            // grid view
            Expanded(
                child: Consumer<CartModel>(
                  builder: (context, value, child){
                    return GridView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: value.shopItems.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1 / 1.3,
                        ),
                        itemBuilder: (context, index){
                          return GroceryItemTile(
                            itemName: value.shopItems[index][0],
                            itemPrice: value.shopItems[index][1],
                            imagePath: value.shopItems[index][2],
                            color: value.shopItems[index][3],
                            onPressed: () {
                              Provider.of<CartModel> (context, listen: false).addItemToCart(index);
                            },
                          );
                        }
                    );
                  },
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CartScreen()));
        },
        child: const Icon(
            Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
    );
  }
}
