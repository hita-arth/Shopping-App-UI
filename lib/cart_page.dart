import 'package:flutter/material.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Your Cart',
            style: TextStyle(
              fontFamily: 'NOTHING',
              fontSize: 14,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(
                cartItem['imageUrl'] as String,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Delete Item',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text('u fr my nigga?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              'Size: ${cartItem['size']}',
            ),
          );
        },
      ),
    );
  }
}
