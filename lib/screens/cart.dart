import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat_dhimas/blocs/cart/cart.dart';
import 'package:stat_dhimas/blocs/cart/cart_event.dart';
import 'package:stat_dhimas/blocs/cart/cart_state.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[200],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        // color: Colors.green,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, cartState) {
      var cart = context.read<CartBloc>();
      print(cart.getCartItems);
      return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () {
              cart.add(RemoveCart(cart.getCartItems[index]));
              print(index);
            },
          ),
          title: Text(
            cart.items[index].name,
          ),
        ),
      );
    });
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 34);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, cart) => Text(
                      'Price : \Rp.${context.read<CartBloc>().totalPrice}',
                      style: hugeStyle),
                ),
                SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Buying not supported yet.')));
                  },
                  style: TextButton.styleFrom(primary: Colors.black),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
