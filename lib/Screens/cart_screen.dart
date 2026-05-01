// ignore_for_file: undefined_method

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/cart_data.dart';
import 'package:flutter_application_1/data/order_data.dart';
import 'package:flutter_application_1/models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double getTotal() {
    double total = 0;
    for (var item in cartList) {
      total += item.price;
    }
    return total;
  }

  void confirmOrder() {
    if (cartList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Your cart is empty.")),
      );
      return;
    }

    for (var item in cartList) {
      orderList.add(Order(
        itemName: item.name,
        quantity: 1,
        date: DateTime.now(),
      ));
    }

    cartList.clear();
    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Order Confirmed!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Column(
        children: [
          Expanded(
            child: cartList.isEmpty
                ? const Center(child: Text('Your cart is empty.'))
                : ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (_, i) {
                      final item = cartList[i];
                      return ListTile(
                        title: Text(item.name),
                        subtitle:
                            Text("\$${item.price.toStringAsFixed(2)}"),
                      );
                    },
                  ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Total: \$${getTotal().toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: confirmOrder,
              child: const Text("Confirm Order"),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}