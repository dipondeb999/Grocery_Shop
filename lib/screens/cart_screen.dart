import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
            'Add Cart',
          style: TextStyle(
              color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
              Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child){
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: value.cartItems.length,
                    itemBuilder: (context,index){
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                              value.cartItems[index][2],
                            height: 36,
                          ),
                          title: Text(value.cartItems[index][0]),
                          subtitle: Text('\$' + value.cartItems[index][1]),
                          trailing: IconButton(
                            onPressed: () => Provider.of<CartScreen> (context, listen: false),
                              icon : const Icon(Icons.cancel)
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          );
        },
      )
    );
  }
}
